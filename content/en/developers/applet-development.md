---
description: Complete guide to building custom Angular applets for BigLedger - from development setup to deployment.
tags:
- applet-development
- angular
- custom-development
- platform-extensions
title: Applet Development Guide
weight: 60
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

Build custom Angular applets that integrate seamlessly with the BigLedger platform. This comprehensive guide covers everything from development setup to deployment and distribution.

{{< callout type="info" >}}
**What are BigLedger Applets?** Applets are modular Angular applications that extend BigLedger's functionality. They run within the BigLedger interface and have full access to the platform's APIs and services.
{{< /callout >}}

## Overview

BigLedger applets are Angular applications that:
- Run within the BigLedger platform interface
- Have full access to BigLedger APIs and data
- Share authentication and user context
- Follow consistent UI/UX patterns
- Can be distributed through the BigLedger App Store

## Getting Started

### Prerequisites

- **Node.js** 18+ with npm or yarn
- **Angular CLI** 15+ 
- **BigLedger Developer Account** with applet development permissions
- **Git** for version control

### Development Environment Setup

```bash
# Install BigLedger Applet CLI
npm install -g @bigledger/applet-cli

# Create new applet project
bl-applet create my-custom-applet --template=business

# Navigate to project directory
cd my-custom-applet

# Install dependencies
npm install

# Start development server
npm run dev
```

### Project Structure

```
my-custom-applet/
├── src/
│   ├── app/
│   │   ├── components/         # Custom components
│   │   ├── services/          # Business logic services
│   │   ├── models/            # TypeScript interfaces
│   │   ├── pages/             # Route components
│   │   └── app.module.ts      # Main module
│   ├── assets/                # Static assets
│   └── environments/          # Environment configs
├── applet.config.json         # Applet configuration
├── package.json
└── README.md
```

## Applet Configuration

The `applet.config.json` file defines your applet's metadata and capabilities:

```json
{
  "id": "custom-inventory-manager",
  "name": "Custom Inventory Manager",
  "version": "1.0.0",
  "description": "Advanced inventory management with custom workflows",
  "author": {
    "name": "Your Company",
    "email": "support@yourcompany.com",
    "website": "https://yourcompany.com"
  },
  "category": "inventory",
  "permissions": [
    "inventory:read",
    "inventory:write",
    "products:read",
    "reports:generate"
  ],
  "navigation": {
    "menu": "Inventory",
    "icon": "cube",
    "routes": [
      {
        "path": "/inventory/custom",
        "title": "Custom Manager",
        "component": "CustomInventoryComponent"
      }
    ]
  },
  "apis": {
    "required": ["inventory", "products", "reports"],
    "optional": ["notifications", "webhooks"]
  },
  "dependencies": {
    "@angular/core": "^15.0.0",
    "@bigledger/applet-sdk": "^2.0.0"
  }
}
```

## BigLedger Applet SDK

### Installation and Setup

```bash
npm install @bigledger/applet-sdk
```

```typescript
// app.module.ts
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BigLedgerAppletModule } from '@bigledger/applet-sdk';

import { AppComponent } from './app.component';

@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    BigLedgerAppletModule.forRoot({
      appletId: 'custom-inventory-manager',
      apiVersion: 'v1'
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
```

### Core Services

The SDK provides several core services for applet development:

#### BigLedgerAPI Service

```typescript
import { Component, OnInit } from '@angular/core';
import { BigLedgerAPIService } from '@bigledger/applet-sdk';

@Component({
  selector: 'app-inventory-dashboard',
  templateUrl: './inventory-dashboard.component.html'
})
export class InventoryDashboardComponent implements OnInit {
  
  constructor(private blApi: BigLedgerAPIService) {}

  async ngOnInit() {
    // Access BigLedger APIs
    const inventory = await this.blApi.inventory.list({
      location: 'warehouse-1',
      lowStock: true
    });

    const products = await this.blApi.products.list({
      category: 'electronics'
    });

    console.log('Low stock items:', inventory);
    console.log('Electronics products:', products);
  }

  async createStockAdjustment(itemId: string, quantity: number) {
    const adjustment = await this.blApi.inventory.adjust({
      itemId,
      adjustmentType: 'increase',
      quantity,
      reason: 'Manual adjustment from custom applet',
      location: 'warehouse-1'
    });

    return adjustment;
  }
}
```

#### User Context Service

```typescript
import { Component, OnInit } from '@angular/core';
import { UserContextService } from '@bigledger/applet-sdk';

@Component({
  selector: 'app-user-dashboard',
  templateUrl: './user-dashboard.component.html'
})
export class UserDashboardComponent implements OnInit {
  
  constructor(private userContext: UserContextService) {}

  ngOnInit() {
    // Access current user information
    const user = this.userContext.getCurrentUser();
    console.log('Current user:', user);

    // Access company information
    const company = this.userContext.getCurrentCompany();
    console.log('Current company:', company);

    // Check permissions
    const canManageInventory = this.userContext.hasPermission('inventory:write');
    console.log('Can manage inventory:', canManageInventory);
  }
}
```

#### Navigation Service

```typescript
import { Component } from '@angular/core';
import { NavigationService } from '@bigledger/applet-sdk';

@Component({
  selector: 'app-navigation-example',
  templateUrl: './navigation-example.component.html'
})
export class NavigationExampleComponent {
  
  constructor(private navigation: NavigationService) {}

  navigateToInvoice(invoiceId: string) {
    // Navigate to BigLedger's invoice page
    this.navigation.navigateTo('/invoices', { id: invoiceId });
  }

  openCustomerDialog(customerId: string) {
    // Open BigLedger's customer dialog
    this.navigation.openDialog('customer', {
      customerId,
      mode: 'edit'
    });
  }

  showNotification(message: string) {
    // Show platform notification
    this.navigation.showNotification({
      message,
      type: 'success',
      duration: 3000
    });
  }
}
```

## UI Components and Styling

### Using BigLedger UI Components

```typescript
import { Component } from '@angular/core';
import { 
  BLButtonModule, 
  BLTableModule, 
  BLFormModule,
  BLCardModule 
} from '@bigledger/ui-components';

@Component({
  selector: 'app-inventory-list',
  template: `
    <bl-card title="Inventory Management">
      <bl-form [formGroup]="filterForm">
        <bl-form-field>
          <bl-input placeholder="Search products..." formControlName="search"></bl-input>
        </bl-form-field>
        <bl-form-field>
          <bl-select placeholder="Category" formControlName="category">
            <bl-option value="electronics">Electronics</bl-option>
            <bl-option value="furniture">Furniture</bl-option>
          </bl-select>
        </bl-form-field>
        <bl-button type="primary" (click)="searchProducts()">Search</bl-button>
      </bl-form>

      <bl-table [dataSource]="inventoryItems" [columns]="tableColumns">
        <ng-template blColumnDef="actions" let-item>
          <bl-button size="small" (click)="adjustStock(item)">Adjust</bl-button>
          <bl-button size="small" type="secondary" (click)="viewDetails(item)">Details</bl-button>
        </ng-template>
      </bl-table>
    </bl-card>
  `
})
export class InventoryListComponent {
  // Component implementation
}
```

### Custom Styling

```scss
// styles.scss
@import '@bigledger/ui-components/themes/default';

.custom-inventory-manager {
  // Your custom styles that follow BigLedger's design system
  
  .inventory-card {
    @include bl-card-elevation(2);
    margin: 16px;
    padding: 24px;
  }

  .low-stock-warning {
    @include bl-status-color('warning');
  }

  .out-of-stock-alert {
    @include bl-status-color('danger');
  }
}
```

## Data Models and TypeScript Interfaces

Define TypeScript interfaces that extend BigLedger's base models:

```typescript
// models/inventory.models.ts
import { BaseEntity, Product, Location } from '@bigledger/applet-sdk';

export interface CustomInventoryItem extends BaseEntity {
  id: string;
  productId: string;
  product?: Product;
  locationId: string;
  location?: Location;
  currentStock: number;
  minimumStock: number;
  maximumStock: number;
  reorderLevel: number;
  reorderQuantity: number;
  unitCost: number;
  totalValue: number;
  lastStockTake: Date;
  customFields: {
    binLocation?: string;
    serialNumbers?: string[];
    expiryDate?: Date;
    supplier?: string;
  };
}

export interface StockAdjustmentRequest {
  itemId: string;
  adjustmentType: 'increase' | 'decrease' | 'set';
  quantity: number;
  reason: string;
  reference?: string;
  notes?: string;
  effectiveDate?: Date;
}

export interface InventoryReport {
  reportId: string;
  generatedAt: Date;
  totalItems: number;
  totalValue: number;
  lowStockItems: number;
  outOfStockItems: number;
  items: CustomInventoryItem[];
}
```

## Services and Business Logic

Create services to handle business logic and API interactions:

```typescript
// services/custom-inventory.service.ts
import { Injectable } from '@angular/core';
import { BigLedgerAPIService } from '@bigledger/applet-sdk';
import { Observable, BehaviorSubject } from 'rxjs';
import { CustomInventoryItem, StockAdjustmentRequest } from '../models/inventory.models';

@Injectable({
  providedIn: 'root'
})
export class CustomInventoryService {
  
  private inventorySubject = new BehaviorSubject<CustomInventoryItem[]>([]);
  public inventory$ = this.inventorySubject.asObservable();

  constructor(private blApi: BigLedgerAPIService) {}

  async loadInventory(filters?: any): Promise<CustomInventoryItem[]> {
    try {
      const response = await this.blApi.inventory.list({
        ...filters,
        includeCustomFields: true
      });

      const items = response.data.map(item => this.mapToCustomInventoryItem(item));
      this.inventorySubject.next(items);
      return items;
    } catch (error) {
      console.error('Error loading inventory:', error);
      throw error;
    }
  }

  async adjustStock(request: StockAdjustmentRequest): Promise<CustomInventoryItem> {
    try {
      const adjustment = await this.blApi.inventory.adjust(request);
      
      // Refresh inventory data
      await this.loadInventory();
      
      return this.mapToCustomInventoryItem(adjustment.inventoryItem);
    } catch (error) {
      console.error('Error adjusting stock:', error);
      throw error;
    }
  }

  async generateCustomReport(filters?: any): Promise<any> {
    try {
      // Use BigLedger's reporting API with custom parameters
      const report = await this.blApi.reports.generate({
        type: 'inventory_valuation',
        format: 'json',
        filters: {
          includeZeroStock: false,
          ...filters
        },
        customFields: [
          'binLocation',
          'expiryDate',
          'serialNumbers'
        ]
      });

      return report;
    } catch (error) {
      console.error('Error generating report:', error);
      throw error;
    }
  }

  private mapToCustomInventoryItem(item: any): CustomInventoryItem {
    return {
      ...item,
      customFields: {
        binLocation: item.customFields?.binLocation || '',
        serialNumbers: item.customFields?.serialNumbers || [],
        expiryDate: item.customFields?.expiryDate ? new Date(item.customFields.expiryDate) : undefined,
        supplier: item.customFields?.supplier || ''
      }
    };
  }
}
```

## Testing

### Unit Testing

```typescript
// custom-inventory.service.spec.ts
import { TestBed } from '@angular/core/testing';
import { BigLedgerAPIService } from '@bigledger/applet-sdk';
import { CustomInventoryService } from './custom-inventory.service';

describe('CustomInventoryService', () => {
  let service: CustomInventoryService;
  let mockBlApi: jasmine.SpyObj<BigLedgerAPIService>;

  beforeEach(() => {
    const blApiSpy = jasmine.createSpyObj('BigLedgerAPIService', ['inventory']);
    
    TestBed.configureTestingModule({
      providers: [
        CustomInventoryService,
        { provide: BigLedgerAPIService, useValue: blApiSpy }
      ]
    });

    service = TestBed.inject(CustomInventoryService);
    mockBlApi = TestBed.inject(BigLedgerAPIService) as jasmine.SpyObj<BigLedgerAPIService>;
  });

  it('should load inventory items', async () => {
    const mockData = [
      { id: '1', productId: 'prod-1', currentStock: 100 },
      { id: '2', productId: 'prod-2', currentStock: 50 }
    ];

    mockBlApi.inventory.list.and.returnValue(Promise.resolve({ data: mockData }));

    const result = await service.loadInventory();
    expect(result).toHaveLength(2);
    expect(mockBlApi.inventory.list).toHaveBeenCalled();
  });

  it('should adjust stock correctly', async () => {
    const mockItem = { id: '1', productId: 'prod-1', currentStock: 110 };
    mockBlApi.inventory.adjust.and.returnValue(Promise.resolve({ inventoryItem: mockItem }));
    mockBlApi.inventory.list.and.returnValue(Promise.resolve({ data: [mockItem] }));

    const request: StockAdjustmentRequest = {
      itemId: '1',
      adjustmentType: 'increase',
      quantity: 10,
      reason: 'Test adjustment'
    };

    const result = await service.adjustStock(request);
    expect(result.currentStock).toBe(110);
  });
});
```

### Integration Testing

```typescript
// app.component.spec.ts
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { BigLedgerAppletModule } from '@bigledger/applet-sdk';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  let component: AppComponent;
  let fixture: ComponentFixture<AppComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [AppComponent],
      imports: [
        BigLedgerAppletModule.forRoot({
          appletId: 'test-applet',
          apiVersion: 'v1',
          testMode: true
        })
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(AppComponent);
    component = fixture.componentInstance;
  });

  it('should create the applet', () => {
    expect(component).toBeTruthy();
  });

  it('should initialize with BigLedger context', () => {
    fixture.detectChanges();
    expect(component.isInitialized).toBe(true);
  });
});
```

## Building and Packaging

### Build Configuration

```json
// angular.json
{
  "projects": {
    "my-custom-applet": {
      "architect": {
        "build": {
          "builder": "@bigledger/applet-builders:build",
          "options": {
            "outputPath": "dist/my-custom-applet",
            "index": "src/index.html",
            "main": "src/main.ts",
            "polyfills": "src/polyfills.ts",
            "tsConfig": "tsconfig.app.json",
            "optimization": true,
            "sourceMap": false,
            "extractCss": true,
            "namedChunks": false,
            "aot": true,
            "buildOptimizer": true,
            "appletConfig": "applet.config.json"
          }
        }
      }
    }
  }
}
```

### Build Commands

```bash
# Development build
npm run build:dev

# Production build
npm run build:prod

# Create distributable package
npm run package

# Validate applet package
bl-applet validate dist/my-custom-applet.blapp
```

## Deployment

### Local Development Deployment

```bash
# Deploy to local BigLedger development environment
bl-applet deploy --target=local --env=development

# Watch for changes and auto-deploy
bl-applet deploy --watch --target=local
```

### Staging Deployment

```bash
# Deploy to BigLedger staging environment
bl-applet deploy --target=staging --env=staging

# Run integration tests
bl-applet test --integration --env=staging
```

### Production Deployment

```bash
# Create production package
npm run build:prod && npm run package

# Submit to BigLedger App Store
bl-applet publish --package=dist/my-custom-applet.blapp

# Deploy to private company store
bl-applet deploy --target=company --company-id=your-company-id
```

## Best Practices

### Performance Optimization

1. **Lazy Loading**: Implement lazy loading for large modules
2. **OnPush Change Detection**: Use OnPush strategy for better performance
3. **Track By Functions**: Use trackBy functions in *ngFor loops
4. **Image Optimization**: Optimize images and use WebP format
5. **Bundle Analysis**: Regular bundle size analysis

### Security Guidelines

1. **Input Validation**: Always validate user inputs
2. **XSS Prevention**: Use Angular's built-in sanitization
3. **API Security**: Follow BigLedger's API security guidelines
4. **Permissions**: Respect user permissions and roles
5. **Data Privacy**: Handle sensitive data according to regulations

### Code Organization

```
src/app/
├── core/                  # Core services and guards
├── shared/               # Shared components and utilities
├── features/             # Feature modules
│   ├── inventory/
│   │   ├── components/
│   │   ├── services/
│   │   ├── models/
│   │   └── inventory.module.ts
│   └── reports/
├── layouts/              # Layout components
└── app-routing.module.ts
```

### Error Handling

```typescript
// error.service.ts
import { Injectable } from '@angular/core';
import { NotificationService } from '@bigledger/applet-sdk';

@Injectable({
  providedIn: 'root'
})
export class ErrorService {
  
  constructor(private notification: NotificationService) {}

  handleError(error: any, userMessage?: string) {
    console.error('Applet Error:', error);
    
    // Log to BigLedger's error tracking
    this.logToBigLedger(error);
    
    // Show user-friendly message
    this.notification.showError(
      userMessage || 'An unexpected error occurred. Please try again.'
    );
  }

  private logToBigLedger(error: any) {
    // Implementation for logging errors to BigLedger's system
  }
}
```

## Distribution

### BigLedger App Store

1. **Submission Requirements**:
   - Complete applet.config.json
   - Comprehensive documentation
   - Screenshots and demo videos
   - Test results and validation reports

2. **Review Process**:
   - Automated security scan
   - Functionality testing
   - UI/UX review
   - Performance analysis

3. **Publishing**:
   - Version management
   - Release notes
   - Update distribution

### Private Distribution

```bash
# Create private company package
bl-applet package --private --company=your-company

# Install in specific BigLedger instances
bl-applet install --package=my-applet.blapp --instance=production
```

## Monitoring and Analytics

### Built-in Analytics

```typescript
import { AnalyticsService } from '@bigledger/applet-sdk';

@Injectable()
export class InventoryAnalyticsService {
  
  constructor(private analytics: AnalyticsService) {}

  trackStockAdjustment(itemId: string, adjustment: number) {
    this.analytics.track('stock_adjustment', {
      itemId,
      adjustmentAmount: adjustment,
      timestamp: new Date().toISOString()
    });
  }

  trackReportGeneration(reportType: string) {
    this.analytics.track('report_generated', {
      reportType,
      userId: this.analytics.getCurrentUserId(),
      timestamp: new Date().toISOString()
    });
  }
}
```

### Performance Monitoring

```typescript
import { PerformanceService } from '@bigledger/applet-sdk';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html'
})
export class DashboardComponent implements OnInit {
  
  constructor(private performance: PerformanceService) {}

  async ngOnInit() {
    const startTime = this.performance.mark('dashboard-load-start');
    
    try {
      await this.loadDashboardData();
      this.performance.measure('dashboard-load-time', startTime);
    } catch (error) {
      this.performance.recordError('dashboard-load-failed', error);
    }
  }
}
```

## Migration and Updates

### Version Management

```json
// applet.config.json
{
  "version": "1.2.0",
  "compatibility": {
    "bigledger": ">=2.0.0",
    "angular": "^15.0.0"
  },
  "migrations": [
    {
      "from": "1.0.0",
      "to": "1.1.0",
      "script": "migrations/v1.1.0-migration.js"
    },
    {
      "from": "1.1.0", 
      "to": "1.2.0",
      "script": "migrations/v1.2.0-migration.js"
    }
  ]
}
```

### Migration Scripts

```typescript
// migrations/v1.2.0-migration.ts
import { AppletMigration } from '@bigledger/applet-sdk';

export class V120Migration implements AppletMigration {
  
  async up(): Promise<void> {
    // Migration logic for upgrading to v1.2.0
    console.log('Migrating to version 1.2.0...');
    
    // Update local storage structure
    this.migrateLocalStorage();
    
    // Update user preferences
    await this.migrateUserPreferences();
    
    console.log('Migration to 1.2.0 completed successfully');
  }

  async down(): Promise<void> {
    // Rollback logic if needed
    console.log('Rolling back from version 1.2.0...');
  }

  private migrateLocalStorage() {
    // Implementation for localStorage migration
  }

  private async migrateUserPreferences() {
    // Implementation for user preferences migration
  }
}
```

Ready to start building your custom BigLedger applet? Follow this guide step by step, and don't hesitate to reach out to our developer support team for assistance!