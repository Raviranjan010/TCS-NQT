$root = "d:\Temp\TCS-NQT-Complete-Preparation"

# Helper
function New-PlaceholderFile {
    param([string]$Path, [string]$Heading)
    $dir = Split-Path $Path -Parent
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
    [System.IO.File]::WriteAllText($Path, "# $Heading`r`n", [System.Text.Encoding]::UTF8)
}

# ROOT FILES
$rootFiles = @(
    @{f="README.md";          h="TCS NQT Complete Preparation - Repository Overview"},
    @{f="ROADMAP.md";         h="TCS NQT Complete Preparation - Roadmap"},
    @{f="STUDY_PLAN.md";      h="TCS NQT Complete Preparation - Study Plan"},
    @{f="EXAM_STRATEGY.md";   h="TCS NQT Complete Preparation - Exam Strategy"},
    @{f="INTERVIEW_GUIDE.md"; h="TCS NQT Complete Preparation - Interview Guide"},
    @{f="RESOURCES.md";       h="TCS NQT Complete Preparation - Resources"},
    @{f="CONTRIBUTING.md";    h="TCS NQT Complete Preparation - Contributing Guide"}
)
foreach ($item in $rootFiles) {
    New-PlaceholderFile -Path "$root\$($item.f)" -Heading $item.h
}

# ASSETS subfolders
foreach ($d in @("banners","diagrams","flowcharts","mindmaps","cheat-sheets","illustrations","images")) {
    $p = "$root\assets\$d"
    if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null }
    [System.IO.File]::WriteAllText("$p\.gitkeep","", [System.Text.Encoding]::UTF8)
}

# 00_Getting_Started files
$gsFiles = @(
    @{f="Exam_Pattern.md";      h="Getting Started - TCS NQT Exam Pattern"},
    @{f="Marks_Distribution.md";h="Getting Started - Marks Distribution"},
    @{f="Prime_Strategy.md";    h="Getting Started - TCS Prime Strategy"},
    @{f="Time_Management.md";   h="Getting Started - Time Management Tips"},
    @{f="Common_Mistakes.md";   h="Getting Started - Common Mistakes to Avoid"},
    @{f="FAQs.md";              h="Getting Started - Frequently Asked Questions"}
)
foreach ($item in $gsFiles) {
    New-PlaceholderFile -Path "$root\00_Getting_Started\$($item.f)" -Heading $item.h
}

# 17 files per leaf topic
$leafFiles = @(
    @{f="README.md";              label="Overview"},
    @{f="notes.md";               label="Notes"},
    @{f="formula.md";             label="Formulas"},
    @{f="shortcuts.md";           label="Shortcuts"},
    @{f="tricks.md";              label="Tricks and Traps"},
    @{f="visualization.md";       label="Visualization"},
    @{f="examples.md";            label="Worked Examples"},
    @{f="practice_basic.md";      label="Practice - Basic"},
    @{f="practice_medium.md";     label="Practice - Medium"},
    @{f="practice_advanced.md";   label="Practice - Advanced"},
    @{f="important_questions.md"; label="Important Questions"},
    @{f="pyq.md";                 label="Previous Year Questions"},
    @{f="coding_application.md";  label="Coding Application"},
    @{f="mistakes.md";            label="Common Mistakes"},
    @{f="revision.md";            label="Quick Revision"},
    @{f="mindmap.md";             label="Mind Map"},
    @{f="cheatsheet.md";          label="Cheat Sheet"},
    @{f="quiz.md";                label="Quiz"}
)

function New-TopicFolder {
    param([string]$FolderPath, [string]$TopicName)
    foreach ($item in $leafFiles) {
        New-PlaceholderFile -Path "$FolderPath\$($item.f)" -Heading "$TopicName - $($item.label)"
    }
}

# 01_Quantitative_Ability
$quant = @(
    @{d="01_Number_System";           t="Number System"},
    @{d="02_Percentage";              t="Percentage"},
    @{d="03_Ratio_Proportion";        t="Ratio and Proportion"},
    @{d="04_Average";                 t="Average"},
    @{d="05_Profit_Loss";             t="Profit and Loss"},
    @{d="06_SI_CI";                   t="Simple and Compound Interest"},
    @{d="07_Time_Work";               t="Time and Work"},
    @{d="08_Time_Speed_Distance";     t="Time Speed and Distance"},
    @{d="09_Permutation_Combination"; t="Permutation and Combination"},
    @{d="10_Probability";             t="Probability"},
    @{d="11_Data_Interpretation";     t="Data Interpretation"}
)
foreach ($item in $quant) {
    New-TopicFolder -FolderPath "$root\01_Quantitative_Ability\$($item.d)" -TopicName $item.t
}

# 02_Reasoning
$reasoning = @(
    @{d="01_Coding_Decoding";       t="Coding Decoding"},
    @{d="02_Blood_Relation";        t="Blood Relation"},
    @{d="03_Direction_Sense";       t="Direction Sense"},
    @{d="04_Seating_Arrangement";   t="Seating Arrangement"},
    @{d="05_Syllogism";             t="Syllogism"},
    @{d="06_Statement_Assumption";  t="Statement and Assumption"},
    @{d="07_Statement_Conclusion";  t="Statement and Conclusion"},
    @{d="08_Puzzle";                t="Puzzle"},
    @{d="09_Series";                t="Series"},
    @{d="10_Analogy_Classification";t="Analogy and Classification"},
    @{d="11_Clock_Calendar";        t="Clock and Calendar"}
)
foreach ($item in $reasoning) {
    New-TopicFolder -FolderPath "$root\02_Reasoning\$($item.d)" -TopicName $item.t
}

# 03_Verbal
$verbal = @(
    @{d="01_Reading_Comprehension"; t="Reading Comprehension"},
    @{d="02_Error_Detection";       t="Error Detection"},
    @{d="03_Fill_in_the_Blanks";    t="Fill in the Blanks"},
    @{d="04_Synonym_Antonym";       t="Synonym and Antonym"},
    @{d="05_Sentence_Improvement";  t="Sentence Improvement"},
    @{d="06_Para_Jumbles";          t="Para Jumbles"},
    @{d="07_Active_Passive";        t="Active and Passive Voice"},
    @{d="08_Direct_Indirect";       t="Direct and Indirect Speech"},
    @{d="09_Vocabulary";            t="Vocabulary"}
)
foreach ($item in $verbal) {
    New-TopicFolder -FolderPath "$root\03_Verbal\$($item.d)" -TopicName $item.t
}

# 04_Coding
$coding = @(
    @{d="01_Arrays";     t="Arrays"},
    @{d="02_Strings";    t="Strings"},
    @{d="03_HashMap";    t="HashMap"},
    @{d="04_Searching";  t="Searching"},
    @{d="05_Sorting";    t="Sorting"},
    @{d="06_Math";       t="Math"},
    @{d="07_Recursion";  t="Recursion"},
    @{d="08_Easy_DP";    t="Easy Dynamic Programming"},
    @{d="09_Stack_Queue";t="Stack and Queue"},
    @{d="10_LinkedList"; t="Linked List"},
    @{d="11_Matrix";     t="Matrix"}
)
foreach ($item in $coding) {
    New-TopicFolder -FolderPath "$root\04_Coding\$($item.d)" -TopicName $item.t
}

# Other top-level section folders
$otherFolders = @(
    @{d="05_Email_Paragraph_Writing"; h="Email and Paragraph Writing - Overview"},
    @{d="06_Previous_Year_Questions"; h="Previous Year Questions - Overview"},
    @{d="07_Mock_Tests";              h="Mock Tests - Overview"},
    @{d="08_Cheat_Sheets";            h="Cheat Sheets - Overview"},
    @{d="09_Flashcards";              h="Flashcards - Overview"},
    @{d="10_Last_Day_Revision";       h="Last Day Revision - Overview"},
    @{d="11_Interview";               h="Interview Preparation - Overview"},
    @{d="12_Placement_Resources";     h="Placement Resources - Overview"}
)
foreach ($item in $otherFolders) {
    New-PlaceholderFile -Path "$root\$($item.d)\README.md" -Heading $item.h
}

# .gitignore
$gitignoreContent = @"
# OS
.DS_Store
Thumbs.db
desktop.ini

# Editors
.vscode/
.idea/
*.suo
*.user
*.swp
*~

# Build artefacts
*.pdf
*.zip
*.tar.gz

# Node / Python
node_modules/
__pycache__/
*.pyc
.env

# Logs
*.log
"@
[System.IO.File]::WriteAllText("$root\.gitignore", $gitignoreContent, [System.Text.Encoding]::UTF8)

Write-Host "`nSkeleton created." -ForegroundColor Green

# Git
git -C $root init 2>&1
git -C $root config user.email "tcs-nqt-prep@example.com" 2>&1
git -C $root config user.name "TCS NQT Prep" 2>&1
git -C $root add -A 2>&1
git -C $root commit -m "Initial repo skeleton for TCS NQT prep" 2>&1

Write-Host "`nGit repo initialised and committed." -ForegroundColor Green

# TREE OUTPUT
Write-Host "`nFull directory tree:" -ForegroundColor Cyan
Get-ChildItem -Path $root -Recurse -Force |
    Where-Object { $_.FullName -notmatch '\\.git\\' } |
    Sort-Object FullName |
    ForEach-Object {
        $rel = $_.FullName.Substring($root.Length).TrimStart('\')
        $depth = ($rel.Split('\').Count - 1)
        $indent = "  " * $depth
        if ($_.PSIsContainer) { "${indent}[DIR]  $($_.Name)" }
        else                  { "${indent}[FILE] $($_.Name)" }
    }

# COUNTS
$totalFiles = (Get-ChildItem -Path $root -Recurse -File | Where-Object { $_.FullName -notmatch '\\.git\\' }).Count
$totalDirs  = (Get-ChildItem -Path $root -Recurse -Directory | Where-Object { $_.FullName -notmatch '\\.git\\' }).Count
Write-Host "`nTOTAL: $totalDirs directories, $totalFiles files (excluding .git)" -ForegroundColor Yellow
