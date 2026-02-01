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

### 3. Cloudflare R2 Integration (Object Storage)
To minimize issues with concurrency and allow infinite runners, the system uploads each account as a unique JSON file to Cloudflare R2 (S3-compatible storage).

**Step 1: Create R2 Bucket**
1.  Go to [Cloudflare Dashboard](https://dash.cloudflare.com/) > **R2**.
2.  Create a new bucket (e.g., `ff-gen-bucket`).

**Step 2: Get Credentials**
1.  On the R2 page, click **"Manage R2 API Tokens"** (sidebar).
2.  Click **"Create API Token"**.
3.  Permissions: **Admin Read & Write**.
4.  Copy the following values:
    -   **Token Value** (Secret Key)
    -   **Access Key ID**
    -   **Endpoint** (Use the S3 API URL for your bucket).

**Step 3: Configure GitHub Secrets**
In your GitHub Repository > **Settings** > **Secrets** > **Actions**, add:

-   `R2_ENDPOINT`: Your R2 S3 Endpoint (e.g. `https://<accountid>.r2.cloudflarestorage.com`)
-   `R2_ACCESS_KEY`: Your Access Key ID
-   `R2_SECRET_KEY`: Your Secret Access Token

**Step 4: Run**
The workflow will now upload every account to `accounts/UID_TIMESTAMP.json`, `rare_accounts/UID_TIMESTAMP.json`, etc.

**Looping**:
If you provided the `PAT`, the workflow will automatically restart itself endlessly, creating a continuous stream of accounts into your R2 bucket.
