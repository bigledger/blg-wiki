# Process Maintenance (PM) Applet

## 1. Introduction

### 1.1 Purpose of the Applet
The Process Maintenance Applet is the central engine for defining your production Bill of Materials (BOM) and Routings. It acts as the bridge between raw inventory and finished goods.

Using this applet, you define:
- Resources: The machines used.
- Methods: Types of processes (e.g., cutting, assembly).
- Recipes: The input materials and ratios required to produce a specific output.

### 1.2 Who Should Use This Guide?
- System Administrators: Responsible for the initial setup of Machines and Process Types (Section 4).
- Production Planners / Engineers: Responsible for creating Process Templates and Job Templates to ensure accurate production workflows (Sections 5 and 6).
- Cost Accountants: Use this module to verify input/output ratios for correct product costing.

### 1.3 Key Concepts
- **Process Template (The "Step")**: A single action. Example: “Cutting Wood.” It takes raw wood (Input) and turns it into a plank (Output).
- **Job Template (The "Journey")**: The master recipe. It combines multiple Process Templates in a specific order to create the final finished good.

---

## 2. Prerequisites
Before creating a process, ensure the following master data is complete:

- **Item Data Hub**: All items (Raw Materials, Semi-Finished Goods, and Finished Goods) must exist.
- **Dog Item Maintenance**: Items must be registered and activated.

Why? The Process Applet can only search for Input/Output items activated in this module.

---

## 3. Step 1: Resource Configuration
(Typically performed by System Admins)

### 3.1 Machine Creation
Define the physical assets available on the factory floor.

**Navigation**: Machine Menu

| Field | Description | Type Options |
|-------|-------------|--------------|
| Name / Code | Unique identifier for the machine. | N/A |
| Type | Defines the machine’s function. | Production Machine / Packing Machine |

### 3.2 Process Type Creation
Define categories or methodologies of work.

**Navigation**: Process Type Menu

| Field | Description | Best Practice Note |
|-------|-------------|--------------------|
| Sequence | Numerical value defining when the process occurs. | Use gaps (10, 20, 30) to allow future insertions. |
| Independent Process | Check if the process stands alone. | Use for non-sequential tasks such as daily maintenance. |

---

## 4. Step 2: Creating the Process Template
(The “Step” – Defining Inputs and Outputs)

**Navigation**: Main Menu > Process Template

### 4.1 Main Details
- Template Name: Clear name (e.g., Assembly - Table Legs).
- Process Type: Select the type created in Step 1.

### 4.2 Defining Items (The Recipe)
This is critical for inventory accuracy.

- **Output Items**: Add the item created by the process and define the ratio (quantity produced per cycle).
- **Input Items**: Add raw materials consumed.

**Ratio Logic Example**:  
If Output = 1 Table, Input must = 4 Legs.

### 4.3 Machine Usage
- Select the machine(s) defined in Step 1.
- If multiple machines can be used, check all applicable ones.
- Set one as the **Default**.

### 4.4 Machine Spec
Upload attachments such as PDFs, specifications, or images related to the process.

---

## 5. Step 3: Creating the Job Template
(The “Journey” – Linking Processes Together)

### 5.1 Initial Creation
- Navigate to the Job Template menu.
- Select the Final Output Item.
- Save to initialize the template.

### 5.2 Defining Options (The Routing)
A single product may have different manufacturing variations (“Options”).

- Click the Option tab.
- System lists available Process Templates.
- Select the required templates.
- Sequence follows the Process Type sequence from Step 1.

### 5.3 Finalizing the Group
- Select the desired Option.
- Enter Group Name (commonly the Output Item name).
- Click Add Group.
- Verify templates in the Process Group tab.

---

## 6. Best Practices & Troubleshooting

### 6.1 Naming Conventions
Use standard naming format:

Format: `[Department] - [Action] - [Target]`  
Example: `Wood Dept - Cutting - Oak Panel`

### 6.2 Common Issues & Solutions

| Issue | Probable Cause | Solution |
|-------|----------------|----------|
| Cannot find an Input Item | Item not set up in prerequisite applet. | Activate the item in Dog Item Maintenance. |
| Wrong Process Order | Sequence number incorrect. | Adjust sequence number (e.g., change 10 to 20). |
| Cannot Save Job Template | No default machine selected. | Select a machine and mark as Default. |
