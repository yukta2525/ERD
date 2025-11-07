# Instructor Setup Guide - GitHub Classroom for 23 Teams

## Overview

This guide will help you set up GitHub Classroom for your 3 SQL projects with 23 pre-assigned teams.

**Time required:**
- Initial setup: ~30 minutes (one time)
- Per project: ~5 minutes (Projects 1, 2, 3)

**What students will experience:**
- Click assignment link → Repo created automatically → Start working
- No git commands needed (all through VS Code UI)

---

## Phase 1: Create Template Repository (One Time)

### Step 1: Push Template to GitHub

I've created template files in `/Users/vishal/Desktop/554/github-classroom-template/`.

**Push to GitHub:**

1. **Create new repository on GitHub.com:**
   - Go to github.com → New repository
   - Name: `badm350-sql-project-template`
   - **Public** repository (so Classroom can use it)
   - **Do NOT** initialize with README (we have one)
   - Click "Create repository"

2. **Push the template files:**
   ```bash
   cd /Users/vishal/Desktop/554/github-classroom-template
   git init
   git add .
   git commit -m "Add project template structure"
   git branch -M main
   git remote add origin https://github.com/YOUR-USERNAME/badm350-sql-project-template.git
   git push -u origin main
   ```

3. **Make it a template repository:**
   - Go to your repo on GitHub
   - Settings → Check **"Template repository"** checkbox
   - Save

✅ **Template is ready!** You'll use this for all 3 projects.

---

## Phase 2: Create GitHub Classroom (One Time)

### Step 1: Create Classroom

1. Go to **classroom.github.com**
2. Click **"New classroom"**
3. Create or select organization: `badm-350-120255-247989` (or similar)
4. Classroom name: `BADM 350 - Fall 2024` (or current term)
5. Click **"Create classroom"**

### Step 2: Add All 23 Teams

You have two options:

**Option A: Manual Entry (Recommended if <4 students per team)**

For each team:
1. Classroom → **"Teams"** tab
2. Click **"New team"**
3. Team slug: `team01` (use consistent format: team01-team23)
4. Add members: Type each student's GitHub username
5. Click **"Create team"**
6. Repeat 22 more times

**Tips:**
- Use leading zeros: `team01`, `team02`, ... `team23` (keeps them sorted)
- Have your team roster ready with GitHub usernames
- Takes ~10-15 minutes for 23 teams

**Option B: CSV Import (If you have spreadsheet)**

1. Create a CSV file with this format:

```csv
identifier,github_username,name,team
student001,alicesmith,Alice Smith,team01
student002,bobjones,Bob Jones,team01
student003,carolday,Carol Day,team01
student004,davidlee,David Lee,team02
student005,emilychen,Emily Chen,team02
...
```

2. Classroom → **"Students"** tab → **"Import from roster"**
3. Upload CSV
4. Then create teams and assign members

### Step 3: Verify Teams

- Classroom → "Teams" tab
- You should see all 23 teams listed
- Click each to verify members are correct

---

## Phase 3: Create Project Assignments

### Project 1 Assignment

1. **In your classroom, click "New assignment"**

2. **Assignment basics:**
   - Assignment title: `Project 1 - Yelp Data Exploration`
   - Deadline: [Set your due date]
   - Assignment type: **Group assignment**

3. **Repository settings:**
   - Repository visibility: **Private** (only team and you can see)
   - Grant students admin access: **Yes** (they need to manage repo)
   - Repository prefix: Leave as `project1`
     - This creates repos named: `project1-team01`, `project1-team02`, etc.

4. **Starter code:**
   - Add a template repository: **Yes**
   - Select: `your-username/badm350-sql-project-template`
   - This gives each team the folder structure and templates

5. **Team settings:**
   - Enable team creation: **No** (teams are pre-assigned)
   - Maximum team members: 4 (or your actual max)
   - Teams will be automatically assigned when students accept

6. **Click "Create assignment"**

7. **Copy the invitation link** - you'll share this with students

### Project 2 Assignment (Repeat when Project 2 starts)

Same steps as Project 1, but:
- Title: `Project 2 - [Your project name]`
- Repository prefix: `project2`
- Same template, same teams
- New deadline

Creates: `project2-team01`, `project2-team02`, etc.

### Project 3 Assignment (Repeat when Project 3 starts)

Same steps, with:
- Title: `Project 3 - [Your project name]`
- Repository prefix: `project3`

---

## Phase 4: Share with Students

### What to Share with Students

**In your LMS (Canvas, etc.) or via email:**

1. **GitHub Education signup** (do this ASAP for free Copilot):
   ```
   Sign up for GitHub Education (free Copilot!):
   https://education.github.com/pack

   Use your student .edu email
   Approval takes 1-2 days
   ```

2. **VS Code setup instructions:**
   - Share `STUDENT_SETUP_GUIDE.md` (I created this in the template folder)
   - Or post key sections in your LMS

3. **Project 1 Assignment Link:**
   ```
   Project 1 - GitHub Classroom Assignment

   1. Click this link: [PASTE YOUR INVITATION LINK]
   2. Sign in to GitHub
   3. Select your pre-assigned team from the dropdown:
      - You'll see a list like: team01, team02, ..., team23
      - Choose YOUR team number (you should know this already)
   4. Accept the assignment
   5. Wait 30 seconds - your repo will be created
   6. Click "Open in VS Code" or clone the repo

   Your repository will be named: project1-teamXX
   (where XX is your team number)

   No submission needed - I have automatic access to your repo!
   ```

### Important Student Instructions

**Emphasize these points:**
- ✅ Pull before working (get teammates' changes)
- ✅ Commit and Sync after working (share your changes)
- ✅ Use descriptive commit messages
- ✅ Update README and docs regularly
- ✅ Test queries before committing

---

## What Students See

### When They Click the Assignment Link:

1. **GitHub Classroom page:** "Accept this assignment"
2. **Team selection dropdown:**
   ```
   Select a team:
   ○ team01 (3/4 members)
   ○ team02 (4/4 members - full)
   ○ team03 (2/4 members)
   ...
   ○ team14 (0/4 members)  ← Your team
   ...
   ○ team23 (1/4 members)
   ```
3. **Click their team** → Accept assignment
4. **Processing...** (30 seconds)
5. **Success page:** "Your assignment repository: project1-team14"
6. **Link to repo** + "Open in VS Code" button

---

## Your Grading Dashboard

### Accessing Student Work

1. **Go to classroom.github.com**
2. **Click your classroom**
3. **Click the assignment** (e.g., "Project 1")

**You'll see a table:**
```
Team          | Repo Link              | Last Updated | Passed Tests
team01        | project1-team01        | 2 hours ago  | -
team02        | project1-team02        | 5 days ago   | -
...
team14        | project1-team14        | 1 hour ago   | -
```

### Viewing Team Work

**Option 1: Web Interface**
- Click any repo name → Opens on GitHub
- Browse files, view commits, see history
- Leave comments on code (click line numbers)

**Option 2: Clone All Repos**
- Click "Download all repositories" at top of dashboard
- Downloads zip with all 23 team repos
- Grade locally with your preferred tools

**Option 3: Clone Individual Repos**
```bash
# Clone a specific team's repo
git clone https://github.com/YOUR-ORG/project1-team14.git
cd project1-team14

# See who did what
git log --oneline --all --graph
git shortlog -sn  # Commits per person
```

### Checking Individual Contributions

**Method 1: GitHub Web (Visual)**
- Open any team repo on GitHub
- Click "Insights" → "Contributors"
- See graphs of who contributed when

**Method 2: Git Log (Detailed)**
```bash
cd project1-team14
git log --all --pretty=format:"%h - %an, %ar : %s"
```

**Method 3: GitLens in VS Code**
- Install GitLens extension
- Open team repo in VS Code
- Hover over any line → see who wrote it
- View file history, blame, etc.

---

## Grading Rubric Suggestion

Since you can see commit history and contributions:

### Technical Quality (60%)
- **Query correctness** (30%): Do queries produce correct results?
- **Query complexity** (20%): Appropriate use of JOINs, aggregations, subqueries?
- **Code quality** (10%): Proper formatting, comments, follows templates?

### Collaboration & Process (25%)
- **Commit frequency** (5%): Regular commits throughout project (not all at deadline)?
- **Commit quality** (5%): Meaningful commit messages?
- **Balanced contributions** (10%): All team members contributing (check git log)?
- **Documentation** (5%): README and team notes updated?

### Analysis & Insights (15%)
- **Quality of findings** (10%): Interesting insights from queries?
- **Documentation of results** (5%): Results clearly documented in README?

### Peer Evaluation (Optional - can be separate)
- Have students rate teammates' contributions
- Cross-reference with git commit history

---

## Common Issues & Solutions

### "A student can't find their team in the list"

**Cause:** Team name doesn't match what they expect

**Solution:**
- Go to Classroom → Teams
- Verify team exists and student is a member
- Student should see it in dropdown when accepting
- If not there, add them to the team manually

### "Student says repo wasn't created"

**Cause:** Usually just needs to refresh or wait

**Solution:**
1. Wait 30-60 seconds and refresh
2. Check Classroom dashboard - does repo exist?
3. If not, student can try accepting again
4. Or you can manually create repo and add them

### "Two teams with similar names (team1 vs team01)"

**Prevention:** Use consistent naming with leading zeros
- team01, team02, ... team23 (not team1, team2, team23)

### "Student joined wrong team"

**Solution:**
- Classroom → Teams → Find wrong team → Remove student
- Student accepts assignment again → Joins correct team

### "All students pushed to wrong team's repo"

**Prevention:**
- Clearly communicate team assignments beforehand
- Students see team list when accepting - they choose their own
- Emphasize: "Select team XX from the dropdown"

---

## Tips for Success

### Before Projects Start

✅ **Test the workflow yourself:**
- Create a test team
- Accept your own assignment
- Verify template appears correctly
- Try the student workflow in VS Code

✅ **Prepare students early:**
- Share GitHub Education link 1-2 weeks early (approval takes time)
- Have a lab session for VS Code + extension setup
- Do a quick demo of the workflow

✅ **Clear team communication:**
- Publish team rosters beforehand
- Students should know their team number before accepting assignment
- Consider creating a Canvas page: "Team Assignments"

### During Projects

✅ **Monitor the dashboard:**
- Check who hasn't accepted assignment
- See which teams haven't committed recently
- Identify teams that might need help

✅ **Encourage good practices:**
- Remind students to Pull before working
- Show examples of good commit messages
- Share examples of well-documented README

✅ **Provide feedback early:**
- Leave comments on code in first week
- Guide teams toward better queries
- Catch collaboration issues early

### For Projects 2 & 3

✅ **Reuse everything:**
- Same template (or updated version)
- Same teams (students just select again)
- Takes 5 minutes to create new assignment

✅ **Share what worked:**
- Show good examples from Project 1
- Highlight teams with great documentation
- Share interesting queries with class (anonymously if preferred)

---

## Quick Reference

### Creating Each Project Assignment

```
Classroom → New Assignment
├─ Title: Project X - [Name]
├─ Type: Group assignment
├─ Deadline: [Date]
├─ Visibility: Private
├─ Admin access: Yes
├─ Template: badm350-sql-project-template
├─ Prefix: projectX
└─ Max team size: 4

→ Create → Copy invitation link → Share with students
```

### Grading Workflow

```
1. Classroom Dashboard → Click assignment
2. See all 23 repos with last update times
3. For each team:
   - Click repo → Browse code
   - Check queries/final/ for submissions
   - Review commits for contributions
   - Leave feedback if needed
4. Optional: Download all repos for offline grading
```

---

## Next Steps

1. ✅ **Push template to GitHub** (see Phase 1)
2. ✅ **Create classroom** (see Phase 2)
3. ✅ **Add 23 teams** (see Phase 2, Step 2)
4. ✅ **Create Project 1 assignment** (see Phase 3)
5. ✅ **Share with students:**
   - GitHub Education signup link
   - STUDENT_SETUP_GUIDE.md
   - Project 1 invitation link
6. ✅ **Monitor dashboard** during project
7. ✅ **Repeat for Projects 2 & 3** (5 min each)

---

## Resources

- **GitHub Classroom Docs:** docs.github.com/en/education/manage-coursework-with-github-classroom
- **Your Classroom:** classroom.github.com (bookmark this!)
- **GitHub Education:** education.github.com/teachers
- **Template Repo:** [Your template URL after creating]

---

## Questions?

If you run into issues:
1. Check GitHub Classroom docs (very comprehensive)
2. GitHub Education support: education@github.com
3. GitHub Classroom community: github.com/community/community/discussions

---

Good luck! This setup will save you tons of time across all 3 projects. 🚀
