<#
# big Title
a = document.querySelectorAll(".label-name")
var b=''
for(i=0;i<a.length;i++){b += a[i].innerText+"\n"}
# Sub Title
a = document.querySelectorAll(".lesson.ng-star-inserted")
for(i=0;i<a.length;i++){b += a[i].innerText+" "}
#>


$sectionTextList ="1.0 Course Introduction
1.1 Introduction 04:57
2.0 Introduction to DevOps
2.1 Learning Objectives 00:44
2.2 Devops Overview 07:36
2.3 Relationship Between Agile and Devops 03:43
2.4 Devops Toolchain 12:39
2.5 Dasa Devops Principles 06:04
2.6 Challenges With the Traditional Approach 05:26
2.7 Addressing Challenges Through Devops 05:42
2.8 Devops Approach to the Challenges 00:43
2.9 Overview of Devops Tools 05:25
2.10 Best Practices for Devops 04:45
2.11 Categories of Devops Tools 15:32
2.12 Devsecops and Its Manifesto 06:17
2.13 Workflow of Devops and Devsecops 04:49
2.14 Key Takeaways 00:44
2.15 Knowledge Check
3.0 Version Control Systems
3.1 Learning Objectives 00:42
3.2 Overview of Version Control Systems 04:47
3.3 Role of Version Control Systems 02:00
3.4 Types of Control Systems and Their Supporting Tools 14:58
3.5 Overview of Git 11:37
3.6 Overview of Source Code and Version Control Hosts 04:52
3.7 Deploy the Files to Github Via Git 18:35
3.8 Practice Project: Assisted Practice: Deploy to Github Via Git
3.9 Key Takeaways 00:35
3.10 Knowledge Check
3.11 Practice Project: Deploy the Files to Bitbucket Via Git
4.0 Continuous Integration Continuous Deployment and Build Tools
4.1 Learning Objectives 00:38
4.2 Overview and Importance of Continuous Integration and Continuous Deployment 14:59
4.3 Overview and Features of Jenkins 03:02
4.4 Set Up Jenkins 09:29
4.5 Practice Project: Assisted Practice: Install and Configure Jenkins
4.6 Overview and the Features of Teamcity 02:26
4.7 Set Up Teamcity 11:30
4.8 Build Tools and Their Uses 09:30
4.9 Continuous Integration With Jenkins and Maven 10:21
4.10 Practice Project: Assisted Practice: Continuous Integration With Jenkins, Git, and Maven
4.11 Key Takeaways 00:24
4.12 Knowledge Check 
4.13 Practice Project: Lesson-end Project: Continuous Integration With Jenkins, Git, and Maven
5.0 Software and Automation Testing Frameworks
5.1 Learning Objectives 00:41
5.2 Software Testing Overview 09:32
5.3 Testing Levels Approaches and Automation Tools 17:20
5.4 Test-driven Development Approaches and Junit 09:09
5.5 Test-driven Development Approach With Junit 15:03
5.6 Practice Project: Assisted Practice: Tdd With Junit
5.7 Practice Project: Assisted Practice: Cucumber Installation
5.8 Behavior-driven Development Principles Cucumber and Its Applications 06:11
5.9 Behavior-driven Development Approach With Cucumber 33:13
5.10 Practice Project: Assisted Practice: Cucumber With Javascript
5.11 Knowledge Check
5.12 Practice Project: Behaviour-driven Development Approach With Java and Kotlin
6.0 Configuration Management Tools
6.1 Learning Objectives 00:36
6.2 Overview of Configuration Management Tools 02:13
6.3 Managing Infrastructure 00:54
6.4 Types of Configuration Management Tools 00:39
6.5 Overview of Puppet 01:33
6.6 Demonstrate Puppet Configuration 08:18
6.7 Overview of Chef 02:08
6.8 Demonstrate Chef Configuration 09:01
6.9 Overview of Ansible 04:05
6.10 Set Up Apache Web Server Using Ansible 11:14
6.11 Overview of Saltstack 01:43
6.12 Comparison of Ansible Puppet Chef and Saltstack 02:02
6.13 Practice Project: Assisted Practice: Setup Apache Web Server Using Ansible
6.14 Key Takeaways 00:22
6.15 Knowledge Check 6.16 Practice Project: Set Up Mysql Database Using Ansible
7.0 Containerization with Docker
7.1 Learning Objectives 00:39
7.2 Overview of Docker 02:25
7.3 Overview of Virtualization 01:20
7.4 Docker Installation on Multiple Os 09:04
7.5 Mysql Database in Docker Container 04:04
7.6 Practice Project: Assisted Practice: Run Mysql Database in Docker Container
7.7 Docker Installation on Multiple Os 05:42
7.8 Using Docker Compose to Mange a Container 14:43
7.9 Practice Project: Assisted Practice: Docker Compose Wit Centos
7.10 Docker Registry 02:04
7.11 Run Docker Registry With Centos 08:20
7.12 Practice Project: Assisted Practice: Docker Registry With Centos
7.13 Docker Networking 01:35
7.14 Demonstrate Docker Networking With Two Sshs 07:22
7.15 Practice Project: Assisted Practice: Docker Networking With Sshs
7.16 Key Takeaways 00:22
7.17 Knowledge Check
7.18 Practice Project: Build a Docker Image and Deploy to the Docker Hub
8.0 Continuous Monitoring
8.1 Learning Objectives 00:37
8.2 Overview of Continuous Monitoring 01:26
8.3 Types of Monitoring Systems 06:56
8.4 Demonstrate Nagios 04:13
8.5 Working With Nagios Monitoring Tool 19:09
8.6 Practice Project: Assisted Practice: Working With Nagios Monitoring Tool
8.7 Overview of Grafana 02:19
8.8 Elk Stack 01:52
8.9 Key Takeaways 00:24
8.10 Knowledge Check
8.11 Practice Project: Add a Node in Nagios Monitoring Tool
9.0 Need of Cloud in DevOps
9.1 Learning Objectives 00:37
9.2 Overview of Cloud Computing 10:00
9.3 Cloud Services and Models 03:00
9.4 Using Aws in Devops 03:23
9.5 Kubernetes 11:57
9.6 Add a Linux Node to the Kubernetes Cluster 48:28
9.7 Key Takeaways 00:20
9.8 Practice Project: Assisted Practice: Install Kubernetes, Pod Configuration, and Joining Another Linux Node to Cluster
9.9 Knowledge Check
9.10 Practice Project: Host Docker on a Kubernetes Cluster
10.0 Practice Projects
10.1 Practice Project: Manage and Monitor the Docker Containers With Dry Tool
10.2 Practice Project: Automated Delivery of Wordpress Application on Kubernetes"

$sectionAndTime = $sectionTextList.Split([Environment]::NewLine)

$newSection= @{}
$sectionList = @()
$sectionList += foreach ($item in $sectionAndTime) {
    if ($item -match "\d+\.\d+") {
        $newSection = @{
            name = (($item -split "^\d+.\d+")[-1] -split "\d")[0].Trim()
            number = ($item -split "\s")[0]
        }
    }
    if ($item -match "\d+:\d+") {
        $time = ($item -split "\s")[-1]
        $minuteSecond = $time -split ":"
        $newSection.duration = $time
        $newSection.TimeSpan = [timespan]::FromMinutes($minuteSecond[0])+[timespan]::FromSeconds($minuteSecond[1])
    }
    Write-Output (New-Object PSObject -Property $newSection)
}
$sectionList | Out-GridView

$sectionList | Export-Clixml -Path Section.xml

Push-Location D:\MasterDevOps\DevOpsCertificationTraining\
$sectionList = Import-Clixml .\Section.xml
$TitleList = $sectionList | Where-Object number -Match "\d+\.0"
$current=8;$TitleList[$current].number.Split(".")[0];$TitleList[$current].name.Replace(" ","")
code ("{0}_{1}.md" -f ($TitleList[$current].number.Split(".")[0]),$TitleList[$current].name.Replace(" ",""))
code ("{0}_{1}.ps1" -f ($TitleList[$current].number.Split(".")[0]),$TitleList[$current].name.Replace(" ",""))


