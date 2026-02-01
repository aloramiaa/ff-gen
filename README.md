# FF-Gen: Automated Account Generator

This tool generates guest accounts for various regions, checks for rare patterns (ID rarity, couples), and can upload results directly to Firebase for centralized collection.

## Features

-   **Multi-Region Support**: Generate accounts for IND, BR, ID, ME, TH, VN, etc.
-   **Ghost Mode**: Special mode for Brazilian server.
-   **Rarity Check**: Automatically detects rare ID patterns (sequential, repeated digits, etc.).
-   **Couples Check**: Detects matching/sequential IDs between threads.
-   **Cloud Integration**: Pushes generated accounts to Firebase Realtime Database.
-   **GitHub Actions**: Automated workflow to run generation in the cloud.

## Setup & Usage

### 1. Local Usage

**Prerequisites:**
-   Python 3.10+
-   Pip

**Installation:**
```bash
pip install requests pycryptodome colorama urllib3 psutil
```

**Running (Interactive Mode):**
Simply run the script to use the menu-based interface:
```bash
python gen.py
```

**Running (CLI Mode):**
You can run it non-interactively for automation:
```bash
python gen.py --mode cli --region IND --count 10 --name-prefix MyBot --password-prefix Secret --threads 5
```

---

### 2. GitHub Actions Setup (Cloud Generation)

You can run this tool entirely on GitHub Actions to generate thousands of accounts using multiple concurrent runners.

1.  **Fork/Clone** this repository to your GitHub account.
2.  **Enable Actions**: Go to the "Actions" tab in your repository and ensure workflows are enabled.
3.  **Run**:
    -   Select **"Run Account Generator"** from the workflow list.
    -   Click **"Run workflow"**.
    -   Fill in the inputs (Region, Count, etc.).
    -   Click the green button to start.

**Artifacts**:
After the run completes, you can download a `.zip` file containing the generated JSON files from the "Summary" page of the workflow run.

---

### 3. Firebase Integration (Centralized Database)

To collect accounts from multiple GitHub Action runs into a single database:

**Step 1: Create Firebase Project**
1.  Go to [Firebase Console](https://console.firebase.google.com/).
2.  Create a new project.
3.  Go to **Build** > **Realtime Database**.
4.  Click **Create Database** (start in **Test Mode** for initial setup, or set proper rules).

**Step 2: Get Credentials**
1.  **URL**: Copy the database URL (e.g., `https://your-project-id-default-rtdb.firebaseio.com/`).
2.  **Secret**:
    -   Click the **Gear Icon** (Project Settings).
    -   Go to the **Service accounts** tab.
    -   Click **Database secrets**.
    -   Click **Show** and copy the secret key.

**Step 3: Configure GitHub Secrets**
1.  In your GitHub Repository, go to **Settings** > **Secrets and variables** > **Actions**.
2.  Click **New repository secret**.
3.  Add `FIREBASE_URL` with your database URL.
4.  Add `FIREBASE_SECRET` with your secret key.

**Step 4: Run**
Now, when you run the GitHub Action, it will automatically detect these secrets and push every generated account to your Firebase Database in real-time.

To export your data:
-   Go to Firebase Console > Realtime Database.
-   Click the **3 dots** > **Export JSON**.
