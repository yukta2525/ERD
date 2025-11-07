# SQLTools Setup Instructions for Azure SQL Database

## Prerequisites
- VS Code installed
- Azure SQL Database credentials from Project 1 (Kaggle notebooks)

---

## Step 1: Install SQLTools Extension

1. Open VS Code
2. Click the **Extensions** icon in the left sidebar (or press `Cmd+Shift+X` on Mac / `Ctrl+Shift+X` on Windows)
3. Search for **"SQLTools"**
4. Install **"SQLTools"** by Matheus Teixeira
5. Search for **"SQLTools Microsoft SQL Server/Azure"** (or use `@tag:sqltools-driver` to see all available drivers)
6. Install the **SQL Server driver** for SQLTools

---

## Step 2: Gather Your Azure SQL Database Credentials

You used these in your Kaggle notebooks for Project 1. You'll need:

- **Server Name**: `your-server-name.database.windows.net`
- **Database Name**: Your database name (e.g., `mySampleDatabase`)
- **Username**: Your admin username (e.g., `myadmin`)
- **Password**: Your admin password

**Example from Kaggle connection string:**
```python
# In your Kaggle notebook, you had something like:
server = 'badm554fall2025.database.windows.net'
database = 'mySampleDatabase'
username = 'myadmin'
password = 'MyP@ssword2025'
```

---

## Step 3: Create SQLTools Connection

1. Click the **SQLTools** icon in the left sidebar (database icon)
2. Click **"Add New Connection"** (plus icon at the top)
3. Select **"Microsoft SQL Server/Azure"**
4. Fill in the connection details:

   | Field | Value | Example |
   |-------|-------|---------|
   | **Connection name** | Give it a friendly name | `Azure SQL - Project 2` |
   | **Server Address** | Your server name (without protocol) | `badm554fall2025.database.windows.net` |
   | **Port** | Leave as default | `1433` |
   | **Database** | Your database name | `mySampleDatabase` |
   | **Authentication** | Select **"SQL Login"** | SQL Login |
   | **Username** | Your admin username | `myadmin` |
   | **Password** | Your admin password | (your password) |
   | **Connection Timeout** | Leave as default | `15` |
   | **Encrypt** | Check this box ✅ | ✅ Enabled |
   | **Trust Server Certificate** | Check this box ✅ | ✅ Enabled |

5. Click **"Test Connection"** to verify
6. If successful, click **"Save Connection"**

---

## Step 4: Connect to Your Database

1. In the **SQLTools** sidebar, find your saved connection
2. Click on the connection name to expand it
3. Click the **plug icon** (⚡) to connect
4. You should see your database tables listed underneath

---

## Step 5: Create a New SQL Query

1. Right-click on your connection in SQLTools sidebar
2. Select **"New SQL File"**
3. A new SQL editor will open
4. Write your SQL query, for example:
   ```sql
   SELECT name FROM sys.tables ORDER BY name;
   ```
5. To run the query:
   - **Option A**: Click the **"Run on active connection"** button (play icon) at the top
   - **Option B**: Right-click in the editor and select **"Run Current Query"**
   - **Option C**: Use keyboard shortcut: `Cmd+E Cmd+E` (Mac) or `Ctrl+E Ctrl+E` (Windows)

---

## Troubleshooting

### Connection Failed - Login Error
- Double-check your username and password
- Make sure you're using the correct server name (must end with `.database.windows.net`)
- Verify **Encrypt** and **Trust Server Certificate** are both checked

### Connection Timeout
- Check your firewall rule allows your current IP address
- Run this in Azure CLI to add your IP:
  ```bash
  az sql server firewall-rule create \
    --resource-group myResourceGroup \
    --server your-server-name \
    --name AllowMyIP \
    --start-ip-address YOUR_IP \
    --end-ip-address YOUR_IP
  ```

### Cannot Find Server
- Make sure server name includes `.database.windows.net`
- Example: `badm554fall2025.database.windows.net` ✅
- Not just: `badm554fall2025` ❌

---

## Tips

- Save your connection for easy access
- You can have multiple saved connections
- Use **"Save SQL File"** to keep your queries
- Right-click on tables to view structure, data, or generate SELECT statements
- Use auto-complete with `Ctrl+Space` for table and column names

---

## Example Connection Settings (Replace with YOUR values)

```json
{
  "name": "Azure SQL - Project 2",
  "server": "badm554fall2025.database.windows.net",
  "port": 1433,
  "database": "mySampleDatabase",
  "username": "myadmin",
  "password": "MyP@ssword2025",
  "encrypt": true,
  "trustServerCertificate": true
}
```

**Important**: Replace all values with YOUR actual credentials from Project 1!

---

## Need Help?

If you're having trouble connecting:
1. Verify your credentials work in Azure Portal Query Editor first
2. Check your Azure SQL firewall rules
3. Contact the instructor with the specific error message
