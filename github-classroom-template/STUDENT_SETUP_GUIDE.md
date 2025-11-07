# Student Setup Guide - BADM 350 SQL Projects

## One-Time Setup (Do this once for all 3 projects)

### Step 1: Get GitHub Education Benefits (Free Copilot!)

1. Go to **https://education.github.com/pack**
2. Click **"Get your pack"**
3. Sign in with your GitHub account (or create one)
4. Verify with your student email (.edu address)
5. Wait for approval (usually 1-2 days)

**Benefits you'll get:**
- ✅ GitHub Copilot (AI coding assistant - normally $10/month)
- ✅ GitHub Pro account
- ✅ Other developer tools

---

### Step 2: Install VS Code Extensions

Open VS Code and install these extensions:

1. **SQL Server (mssql)** by Microsoft
   - For connecting to Azure SQL database
   - Execute queries, view results

2. **GitHub Pull Requests and Issues** by GitHub
   - Manage git operations through UI (no command line needed)
   - Sign in with your GitHub account when prompted

3. **GitHub Copilot** by GitHub
   - AI assistant for writing SQL queries
   - Only works after GitHub Education approval (Step 1)

**To install:**
- Click Extensions icon (left sidebar) or press `Cmd+Shift+X`
- Search for extension name
- Click "Install"

---

### Step 3: Connect to Azure SQL Database

1. **Get your connection info** (from your instructor or Azure portal):
   - Server name: `your-server.database.windows.net`
   - Database name: `yelp_database`
   - Username: Your SQL login
   - Password: Your SQL password

2. **In VS Code:**
   - Click SQL Server icon (cylinder) in left sidebar
   - Click "Add Connection" (+ icon)
   - Enter the connection details when prompted
   - Choose "Yes" to save password
   - Give it a profile name: "Yelp Database"

3. **Test the connection:**
   - Right-click your connection → "New Query"
   - Type: `SELECT TOP 10 * FROM businesses;`
   - Press `Cmd+Shift+E` to execute
   - You should see results!

---

## For Each Project (Project 1, 2, 3)

### Step 1: Accept GitHub Classroom Assignment

1. **Find the assignment link** in Canvas/email
2. **Click the link** - you'll go to GitHub Classroom
3. **Find your team** in the dropdown list
   - Your team is already assigned (e.g., "team14")
   - Select your team name
4. **Accept the assignment**
5. **Wait 30 seconds** - your repository is being created
6. **You'll see:** "Your repository has been created: project1-team14"

### Step 2: Open Repository in VS Code

**Option A: Direct from GitHub**
1. On the success page, click **"Open in VS Code"**
2. VS Code will open and ask where to save it
3. Choose a location (e.g., `Documents/BADM350/`)

**Option B: Clone Manually**
1. Copy the repository URL
2. In VS Code: `Cmd+Shift+P` → type "Git: Clone"
3. Paste the URL
4. Choose where to save it

### Step 3: Start Working!

Your repository is pre-configured with:
- ✅ Folder structure for queries
- ✅ README template
- ✅ Sample SQL query template
- ✅ Team notes document

---

## Daily Team Workflow

### Before You Start Working

**ALWAYS Pull first to get teammates' latest changes:**

1. Open your project folder in VS Code
2. Click **Source Control** icon (left sidebar - looks like branches)
3. Click the **`...`** menu at top
4. Click **"Pull"**

This gets all your teammates' updates!

---

### While Working

1. **Create or edit SQL files** in `queries/analysis/` folder

2. **Use GitHub Copilot** to help write queries:
   ```sql
   -- Find the top 10 restaurants in Phoenix with highest ratings
   -- that have at least 100 reviews
   -- Include name, address, rating, and review count
   ```
   Copilot will suggest the SQL - press `Tab` to accept!

3. **Test your queries:**
   - Click in your SQL file
   - Press `Cmd+Shift+E` to execute
   - View results in the bottom panel

4. **Save your work:** `Cmd+S`

---

### When You're Done for the Day

**Push your changes so teammates can see them:**

1. **Go to Source Control panel** (left sidebar)

2. **Review your changes:**
   - You'll see a list of files you modified
   - Click on any file to see what changed

3. **Stage your changes:**
   - Click the **`+`** icon next to each file
   - Or click `+` next to "Changes" to stage all

4. **Write a commit message:**
   - In the text box at top, describe what you did
   - Example: "Add query for top restaurants by rating"
   - Be specific, not vague!

5. **Commit:**
   - Click the **✓ Commit** button

6. **Push to GitHub:**
   - Click **"Sync Changes"** button
   - Or click the cloud icon at bottom-left

**Done!** Your work is now on GitHub for your team and instructor to see.

---

## GitHub Copilot Tips

### How to Use Copilot

**Method 1: Write comments**
```sql
-- Calculate the average rating by city for restaurants
-- Only include cities with at least 10 restaurants
-- Sort by average rating descending
```
Press Enter, and Copilot suggests the SQL!

**Method 2: Start typing**
```sql
SELECT city, AVG(stars) as avg_rating
```
Copilot will suggest the rest of the query.

**Method 3: Use the query template**
Copy from `queries/exploration/sample_query.sql` and modify the comments.

### Accepting Suggestions

- **Tab** - Accept entire suggestion
- **Cmd+→** - Accept word by word
- **Esc** - Reject suggestion
- Keep typing - Ignore suggestion

### Getting Better Suggestions

✅ **Good:** "Find top 10 users by review count who joined after 2020"
❌ **Bad:** "get users"

✅ **Good:** Be specific about what columns you need
❌ **Bad:** "SELECT * FROM..." (Copilot doesn't know what you want)

---

## Team Collaboration Tips

### Avoid Conflicts

1. **Pull before you start** each work session
2. **Work on different files** from teammates
3. **Communicate:** Use team chat or `docs/team_notes.md`

### If You Get a Conflict

VS Code will show something like:
```sql
<<<<<<< HEAD (Current Change)
SELECT business_id, stars
=======
SELECT business_id, name, stars
>>>>>>> main (Incoming Change)
```

**To fix:**
1. Click **"Accept Current Change"** or **"Accept Incoming Change"**
   - Or manually keep both by editing
2. Delete the conflict markers (`<<<<`, `====`, `>>>>`)
3. Save and test the query
4. Commit the fixed file

---

## Updating Documentation

### Update README.md

Keep the queries table current:
```markdown
| File | Purpose | Author | Status |
|------|---------|--------|--------|
| top_restaurants.sql | Find top-rated places | Alice | ✅ Complete |
| user_analysis.sql | User behavior patterns | Bob | 🚧 In Progress |
```

### Update docs/team_notes.md

Document your progress weekly:
- What you worked on
- What you found
- Any issues or questions

This helps when writing your final report!

---

## Keyboard Shortcuts

**SQL Operations:**
- `Cmd+Shift+E` - Execute SQL query
- `Cmd+K Cmd+C` - Comment selected lines
- `Cmd+K Cmd+U` - Uncomment selected lines
- `Shift+Alt+F` - Format SQL (makes it pretty)

**VS Code:**
- `Cmd+Shift+P` - Command palette (search all commands)
- `Cmd+P` - Quick file search
- `Cmd+B` - Toggle sidebar
- `Cmd+J` - Toggle bottom panel

**Source Control:**
- `Ctrl+Shift+G` - Open Source Control panel
- Clicking a file shows what changed (diff view)

---

## Troubleshooting

### "I don't see Source Control panel"
- Click the icon on left sidebar (looks like branches)
- Or: `View` → `Source Control`

### "GitHub Copilot isn't working"
- Check bottom-right corner - should show Copilot icon
- Make sure you're signed in to GitHub (bottom-left corner)
- Verify GitHub Education approval went through

### "Can't connect to Azure SQL"
- Verify server name includes `.database.windows.net`
- Check username/password are correct
- Make sure you're on campus network or VPN (if required)

### "My teammate's changes aren't showing"
- Make sure you clicked **Pull** (not just Sync)
- Ask them if they clicked **Sync Changes** after committing
- Check GitHub.com to see if their commits are there

### "I committed but changes aren't on GitHub"
- You need to **Sync/Push** after committing
- Click "Sync Changes" or the cloud icon at bottom

---

## Getting Help

1. **Check with your team first** - they might have solved the same issue
2. **Check `docs/team_notes.md`** - document solutions for your team
3. **Ask in class discussion board**
4. **Office hours** with instructor/TA

---

## Grading Note

Your instructor has automatic access to your repository. **No separate submission needed!**

They can see:
- All your queries and code
- Commit history (who did what)
- When work was committed (timestamps)

Make sure to:
- Commit regularly (not just at the deadline)
- Write meaningful commit messages
- Keep documentation updated
- Test all queries before the deadline

---

## Quick Reference Card

```
📋 BEFORE WORKING
   Source Control → ... → Pull

✏️ WHILE WORKING
   Write queries → Test (Cmd+Shift+E) → Save (Cmd+S)

✅ AFTER WORKING
   Source Control → Stage (+) → Commit message → ✓ Commit → Sync Changes

🤖 COPILOT
   Write comment describing query → Press Enter → Tab to accept

🔄 DAILY ROUTINE
   Pull → Work → Commit → Sync → Update docs
```

---

Good luck with your projects! 🚀
