# Sample Assist Emergency Callout Management - Project Code Blue

Project Code Blue is a Flutter mobile application that extends the Sample Assist Collection Manager experience for onsite drug screening operations. The app focuses on field-ready workflows for dashboard monitoring, onsite job management, emergency callout creation, onsite approvals, client records, reporting preferences, and operational notifications.

The goal of this repository is to show the mobile implementation clearly: what the product does, how the main workflows are structured, and how the screenshots map to the feature order presented in the final project report.

## Project Snapshot

- **Product**: Mobile emergency callout and onsite job management application
- **Platform**: Flutter mobile app targeting Android and iOS
- **Language**: Dart
- **State management**: Provider and feature-level controllers
- **Networking foundation**: Dio API service layer with mock interceptor support
- **Primary users**: Collection agency managers, booking coordinators, collectors, and administrative staff
- **Core domain**: Workplace drug screening, onsite collections, callout response, approvals, and client reporting

## Live Demo and Report

The live walkthrough demonstrates the implemented mobile workflows and the final presentation report documents the project background, design, implementation, and evaluation.

- **Live demo video**: [Watch Project Code Blue live demo on Google Drive](https://drive.google.com/file/d/10IL2cRp2V07POnmEDU9UNQPjDNwEggIk/view?usp=drive_link)
- **Project report**: [Open CSIT998 Assignment 4 Group 14 report on Google Drive](https://drive.google.com/file/d/1MEOLQcqm_8s-kZxZXpQzU0V5sRgD6J-Q/view?usp=drive_link)

## Main Features

- **Operational dashboard** with summary charts for processed tests, sample results, demographics, and collection activity.
- **Onsite jobs home** for scanning planned, active, completed, cancelled, archived, and callout jobs.
- **New onsite job workflow** split into mobile-friendly steps for client details, service requirements, test specifications, collectors, and onsite contacts.
- **Emergency callout workflow** for creating urgent jobs with location, representative, collector, and instruction details.
- **Manage job workflows** for updating onsite and callout jobs while preserving status-driven controls.
- **Onsite approvals** for reviewing job details, assigned collectors, approval information, and signature capture.
- **Client management** for client details, authorized representatives, testing specifications, locations, history, notes, and reporting rules.
- **Reporting configuration** for client-specific delivery methods, reminders, billing contacts, and report completion state.
- **Feature controller architecture** used to keep UI, data models, API access, and feature behavior modular.

## Product Experience

The app is organized around the same order used in the final report:

1. Dashboard
2. Onsite Jobs
3. Onsite Approvals
4. Client Management
5. Client Notes and Reporting
6. Feature Controller Architecture

## Application Screenshots

### Dashboard

The dashboard gives collection teams a quick operational summary before they move into jobs, approvals, clients, or reports.

| Dashboard Home | Dashboard Home Extended |
| --- | --- |
| <img src="docs/screenshots/dashboard-home-part-1.png" alt="Dashboard home summary" width="260"> | <img src="docs/screenshots/dashboard-home-part-2.png" alt="Dashboard home extended summary" width="260"> |

| Tests Processed | Tests Processed Extended |
| --- | --- |
| <img src="docs/screenshots/dashboard-tests-processed-part-1.png" alt="Tests processed overview" width="260"> | <img src="docs/screenshots/dashboard-tests-processed-part-2.png" alt="Tests processed detailed chart" width="260"> |

| Sample Results | Sample Results Extended |
| --- | --- |
| <img src="docs/screenshots/dashboard-sample-results-part-1.png" alt="Sample results overview" width="260"> | <img src="docs/screenshots/dashboard-sample-results-part-2.png" alt="Sample results detailed chart" width="260"> |

| Collection Summary | Collection Summary Extended |
| --- | --- |
| <img src="docs/screenshots/dashboard-collection-summary-part-1.png" alt="Collection summary overview" width="260"> | <img src="docs/screenshots/dashboard-collection-summary-part-2.png" alt="Collection summary extended view" width="260"> |

### Onsite Jobs

The Onsite Jobs module centralizes standard onsite jobs and emergency callout jobs. It supports status scanning, action menus, job creation, and job updates from a mobile layout.

| Onsite Jobs Home | Onsite Jobs Home Extended |
| --- | --- |
| <img src="docs/screenshots/onsite-jobs-home-part-1.png" alt="Onsite jobs home part one" width="260"> | <img src="docs/screenshots/onsite-jobs-home-part-2.png" alt="Onsite jobs home part two" width="260"> |

| More Job Details | Job Actions |
| --- | --- |
| <img src="docs/screenshots/onsite-jobs-home-part-3.png" alt="Onsite jobs details" width="260"> | <img src="docs/screenshots/onsite-jobs-home-part-4.png" alt="Onsite jobs action menu" width="260"> |

### New Onsite Job

The new onsite job flow converts the larger desktop form into a stepped mobile experience. Users can define the client, location, representatives, collectors, test requirements, and onsite instructions before creating the job.

| Step 1: Client Details | Step 1: Location Details |
| --- | --- |
| <img src="docs/screenshots/new-onsite-job-step-1-part-1.png" alt="New onsite job step one client details" width="260"> | <img src="docs/screenshots/new-onsite-job-step-1-part-2.png" alt="New onsite job step one location details" width="260"> |

| Step 1: Representative | Step 1: Collector Assignment |
| --- | --- |
| <img src="docs/screenshots/new-onsite-job-step-1-part-3.png" alt="New onsite job representative details" width="260"> | <img src="docs/screenshots/new-onsite-job-step-1-part-4.png" alt="New onsite job collector assignment" width="260"> |

| Step 2: Testing Requirements | Step 2: Device Details |
| --- | --- |
| <img src="docs/screenshots/new-onsite-job-step-2-part-1.png" alt="New onsite job testing requirements" width="260"> | <img src="docs/screenshots/new-onsite-job-step-2-part-2.png" alt="New onsite job device details" width="260"> |

| Step 3: Instructions | Step 3: Create Job |
| --- | --- |
| <img src="docs/screenshots/new-onsite-job-step-3-part-1.png" alt="New onsite job instructions" width="260"> | <img src="docs/screenshots/new-onsite-job-step-3-part-2.png" alt="New onsite job creation confirmation" width="260"> |

### New Callout Job

The callout flow is designed for urgent jobs that need faster setup and collector assignment.

| Callout Job Details | Callout Instructions |
| --- | --- |
| <img src="docs/screenshots/new-callout-job-part-1.png" alt="New callout job details" width="260"> | <img src="docs/screenshots/new-callout-job-part-2.png" alt="New callout job instructions" width="260"> |

### Manage Onsite Job

Existing onsite jobs can be reviewed and edited through the same mobile-first job structure.

| Manage Onsite Job | Location and Representative |
| --- | --- |
| <img src="docs/screenshots/manage-onsite-job-part-1.png" alt="Manage onsite job details" width="260"> | <img src="docs/screenshots/manage-onsite-job-part-2.png" alt="Manage onsite job location and representative" width="260"> |

| Testing and Collectors | Update Job |
| --- | --- |
| <img src="docs/screenshots/manage-onsite-job-part-3.png" alt="Manage onsite job testing details" width="260"> | <img src="docs/screenshots/manage-onsite-job-part-4.png" alt="Manage onsite job update action" width="260"> |

### Manage Callout Job

Callout jobs can be updated while they remain editable, allowing teams to respond to fast-changing emergency requirements.

| Manage Callout Details | Manage Callout Location |
| --- | --- |
| <img src="docs/screenshots/manage-callout-job-part-1.png" alt="Manage callout job details" width="260"> | <img src="docs/screenshots/manage-callout-job-part-2.png" alt="Manage callout job location" width="260"> |

| Manage Callout Collectors | Update Callout |
| --- | --- |
| <img src="docs/screenshots/manage-callout-job-part-3.png" alt="Manage callout job collectors" width="260"> | <img src="docs/screenshots/manage-callout-job-part-4.png" alt="Manage callout job update action" width="260"> |

### Onsite Approvals

The approvals module supports final job validation by exposing job information, assigned collectors, onsite details, approval information, and signature-related views.

| Approvals Landing | Approval Details Modal |
| --- | --- |
| <img src="docs/screenshots/onsite-approvals-part-1.png" alt="Onsite approvals landing page" width="260"> | <img src="docs/screenshots/onsite-approvals-part-2.png" alt="Onsite approvals details modal" width="260"> |

| Assigned Collectors | Onsite Job Details |
| --- | --- |
| <img src="docs/screenshots/onsite-approvals-part-3.png" alt="Onsite approvals assigned collectors" width="260"> | <img src="docs/screenshots/onsite-approvals-part-4.png" alt="Onsite approvals job details" width="260"> |

| Approval Details | Extended Approval Details |
| --- | --- |
| <img src="docs/screenshots/onsite-approvals-part-5.png" alt="Onsite approval details" width="260"> | <img src="docs/screenshots/onsite-approvals-part-6.png" alt="Onsite approval extended details" width="260"> |

### Client Management

Client Management stores the operational information reused by onsite jobs, callout jobs, approvals, and reporting.

| Client Management Home | Client Management Extended |
| --- | --- |
| <img src="docs/screenshots/client-management-home.png" alt="Client management home" width="260"> | <img src="docs/screenshots/client-management-home-extended.png" alt="Client management extended home" width="260"> |

| Client Details | Client Details Extended |
| --- | --- |
| <img src="docs/screenshots/client-details-part-1.png" alt="Client details form" width="260"> | <img src="docs/screenshots/client-details-part-2.png" alt="Client details extended form" width="260"> |

| Authorized Representatives | Representative Details |
| --- | --- |
| <img src="docs/screenshots/client-authorized-representatives-part-1.png" alt="Client authorized representatives" width="260"> | <img src="docs/screenshots/client-authorized-representatives-part-2.png" alt="Client representative details" width="260"> |

| Client Specifications | Device and Test Requirements |
| --- | --- |
| <img src="docs/screenshots/client-specifications-part-1.png" alt="Client testing specifications" width="260"> | <img src="docs/screenshots/client-specifications-part-2.png" alt="Client device and test requirements" width="260"> |

| Drug Test Specifications | Specification Details |
| --- | --- |
| <img src="docs/screenshots/client-specifications-part-3.png" alt="Client drug test specifications" width="260"> | <img src="docs/screenshots/client-specifications-part-4.png" alt="Client specification details" width="260"> |

| Client Locations | Location Details |
| --- | --- |
| <img src="docs/screenshots/client-location-part-1.png" alt="Client locations list" width="260"> | <img src="docs/screenshots/client-location-part-2.png" alt="Client location details" width="260"> |

| Onsite Job History | Onsite Job History Extended |
| --- | --- |
| <img src="docs/screenshots/client-onsite-job-history-part-1.png" alt="Client onsite job history" width="260"> | <img src="docs/screenshots/client-onsite-job-history-part-2.png" alt="Client onsite job history extended" width="260"> |

### Client Notes

Notes allow teams to record operational context against a client or location, including later edits and removals.

| Notes Home | New Note |
| --- | --- |
| <img src="docs/screenshots/client-notes-home.png" alt="Client notes home" width="260"> | <img src="docs/screenshots/client-notes-new-note.png" alt="Create client note" width="260"> |

| Edit Note | Delete Note |
| --- | --- |
| <img src="docs/screenshots/client-notes-edit-note.png" alt="Edit client note" width="260"> | <img src="docs/screenshots/client-notes-delete-note.png" alt="Delete client note" width="260"> |

### Client Reporting

The reporting section captures how reports should be delivered for each client, including report recipients, report timing, reminder setup, and completed configuration state.

| Reporting Details | Reporting Methods |
| --- | --- |
| <img src="docs/screenshots/client-reporting-part-1.png" alt="Client reporting details" width="260"> | <img src="docs/screenshots/client-reporting-part-2.png" alt="Client reporting methods" width="260"> |

| Reminder Setup | Reporting Completed |
| --- | --- |
| <img src="docs/screenshots/client-reporting-reminder.png" alt="Client reporting reminder setup" width="260"> | <img src="docs/screenshots/client-reporting-completed.png" alt="Client reporting completed state" width="260"> |

## Architecture

The app uses a modular feature structure. Larger product areas live under `lib/screens`, while shared navigation, tabs, app state, color schemas, assets, and error models are separated into their own folders.

```text
Collection-Manager-Mobile-Project-Code/
├── assets/
│   ├── images/
│   └── mockData/
├── lib/
│   ├── AppState/
│   ├── ColorSchemas/
│   ├── ErrorModels/
│   ├── Navigation/
│   ├── SplashScreen/
│   ├── sidemenu/
│   ├── tabs/
│   └── screens/
│       ├── Accounting/
│       ├── ClientManagement/
│       ├── CollectionReports/
│       ├── CollectorsCalendar/
│       ├── Dashboard/
│       ├── FAQ/
│       ├── Home/
│       ├── Login/
│       ├── Notifications/
│       ├── OnsiteApprovals/
│       └── OnsiteJobs/
├── test/
├── android/
└── ios/
```

### Feature Controller Architecture

The Onsite Jobs feature demonstrates the repository's feature controller approach. It groups job models, API access, mock response handling, controllers, screens, and job-specific widgets inside the same feature area.

<img src="docs/screenshots/feature-controller-architecture.png" alt="Feature controller architecture diagram" width="620">

Key Onsite Jobs files include:

- `lib/screens/OnsiteJobs/Controller/Feature/jobs.dart`
- `lib/screens/OnsiteJobs/Controller/Feature/jobs_notifier.dart`
- `lib/screens/OnsiteJobs/Controller/Feature/jobs_api.dart`
- `lib/screens/OnsiteJobs/Controller/Feature/models/job_model.dart`
- `lib/screens/OnsiteJobs/Controller/Feature/utils/api/api_service.dart`
- `lib/screens/OnsiteJobs/Controller/Feature/utils/api/OnSite_Jobs_Mock_Interceptor.dart`

## Project Management Artifacts

The project report also documents the team workflow and planning process.

| Asana | Slack |
| --- | --- |
| <img src="docs/screenshots/project-management-asana.png" alt="Asana project management board" width="300"> | <img src="docs/screenshots/project-communication-slack.png" alt="Slack project communication" width="300"> |

| WhatsApp | Work Breakdown Structure |
| --- | --- |
| <img src="docs/screenshots/project-communication-whatsapp.png" alt="WhatsApp project communication" width="300"> | <img src="docs/screenshots/work-breakdown-structure.png" alt="Project work breakdown structure" width="300"> |

## Local Setup

### Prerequisites

- Flutter SDK compatible with Dart `>=3.3.4 <4.0.0`
- Android Studio or Xcode for emulator/simulator support
- A configured Android emulator or iOS simulator

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Run the App

List available devices:

```bash
flutter devices
```

Run on a selected emulator or simulator:

```bash
flutter run -d <device_id>
```

### 3. Run Tests

```bash
flutter test
```

## Quality and Verification

Useful local checks:

```bash
flutter analyze
flutter test
```

## Project Team

| Name | Role | Contact |
| --- | --- | --- |
| Rusira Senath Liyanage | Team Lead / Project Manager | rusira@sampleassist.com |
| Jinchen Wang | Frontend Lead | jinchen.wang@sampleassist.com |
| Jingwei Li | Software Engineer | jingwei.Li@sampleassist.com |
| Jihoon Lee | AWS Lead | jihoon.lee@sampleassist.com |
| Le Shi | UI/UX Lead | le.shi@sampleassist.com |
| Yejie Wang | Backend Lead | yejie.wang@sampleassist.com |
| Yunheng Luo | Software Engineer | yunheng.luo@sampleassist.com |

## Repository Goal

This repository demonstrates the mobile adaptation of Sample Assist's collection management workflows, with emphasis on onsite job execution, emergency response, approvals, client configuration, reporting, and a modular Flutter code structure that can support future backend integration and Collection Manager features parity.
