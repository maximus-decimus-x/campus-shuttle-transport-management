# Campus Shuttle and Transport Management System

A web-based application designed to manage and organize transportation services within a university campus.

## Project Overview

The **Campus Shuttle and Transport Management System** is a centralized platform that aims to simplify and improve university transportation management.

The system will allow students and faculty members to view available shuttle routes, check trip schedules, reserve or cancel seats, and submit transport-related complaints.

Administrators will be able to manage users, drivers, vehicles, routes, trip schedules, bookings, vehicle maintenance records, and transportation reports.

The primary goal is to make campus transportation more efficient, organized, accessible, and reliable.

## Main Features

### 1. User and Driver Management
- Manage student, faculty, driver, and administrator accounts.
- Maintain personal information and account details.
- Manage user roles and access permissions.

### 2. Vehicle and Route Management
- Maintain vehicle records and seating capacities.
- Manage driver assignments.
- Create and maintain shuttle routes.
- Manage designated stops along routes.

### 3. Trip Scheduling
- Create and manage shuttle schedules.
- Assign routes, vehicles, and drivers to trips.
- Manage departure times and trip dates.

### 4. Passenger Booking and Seat Availability
- View available shuttle trips.
- Reserve and cancel seats.
- Check seat availability.
- View booking history.

### 5. Complaints, Maintenance and Reports
- Record and manage transport-related complaints.
- Maintain vehicle servicing and maintenance records.
- Generate reports about bookings, vehicle availability, trip schedules, and unresolved complaints.

## Technology Stack

| Component | Technology |
|---|---|
| Frontend | HTML5, CSS3, JavaScript |
| Backend | Node.js |
| Backend Framework | Express.js |
| Database | MySQL |
| Version Control | Git |
| Code Hosting | GitHub |

## Project Structure

```text
campus-shuttle-transport-system/
│
├── frontend/
│   ├── assets/
│   │   ├── images/
│   │   └── icons/
│   │
│   ├── css/
│   │   ├── style.css
│   │   ├── components.css
│   │   └── responsive.css
│   │
│   ├── js/
│   │   ├── main.js
│   │   ├── auth.js
│   │   └── dashboard.js
│   │
│   ├── pages/
│   │   ├── student/
│   │   ├── driver/
│   │   └── admin/
│   │
│   └── index.html
│
├── backend/
│
├── database/
│
├── .gitignore
└── README.md
```

## User Roles

The application is designed around the following user roles:

- **Administrator:** Manages the overall transportation system.
- **Student:** Views shuttle trips, books seats, and submits complaints or feedback.
- **Faculty Member:** Accesses transportation services and manages personal bookings.
- **Driver:** Views assigned trips, schedules, and vehicle information.

## Getting Started

### Prerequisites

Before working on the project, make sure you have installed:

- [Git](https://git-scm.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- A modern web browser
- [Node.js](https://nodejs.org/) (required for backend development)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/maximus-decimus-x/campus-shuttle-transport-system.git
```

2. Navigate into the project directory:

```bash
cd campus-shuttle-transport-system
```

3. Open the project in Visual Studio Code:

```bash
code .
```

4. Open `frontend/index.html` using the VS Code Live Server extension to run the frontend during development.

Backend and database setup instructions will be added when those components are implemented.

## Team Collaboration and Git Workflow

This project is developed collaboratively by a team of three members.

We use Git branches to keep development organized and prevent team members from interfering with each other's work.

### Branch Structure

| Branch | Responsibility |
|---|---|
| `main` | Stable and integrated project version |
| `frontend` | Frontend development |
| `backend` | Backend development |
| `database` | Database development |

### Development Workflow

1. Clone the shared GitHub repository.
2. Switch to your assigned branch.
3. Pull the latest changes before starting new work.
4. Implement and test your changes.
5. Commit your work with a meaningful commit message.
6. Push your branch to GitHub.
7. Create a Pull Request to merge completed work into `main`.

### Common Git Commands

```bash
# Check current branch and working tree
git status

# Switch to your assigned branch
git switch frontend

# Get latest remote changes
git fetch origin

# Stage changes
git add .

# Commit changes
git commit -m "Describe your changes"

# Push changes
git push
```

**Important:** Direct pushes to the protected `main` branch are not part of our workflow. Changes should be merged through Pull Requests.

## Development Status

**Current Status: In Development**

| Component | Status |
|---|---|
| Project planning and proposal | Completed |
| ER diagram and database planning | Completed |
| GitHub repository setup | Completed |
| Frontend development | In Progress |
| Backend development | Planned |
| MySQL database implementation | Planned |
| Frontend and backend integration | Planned |
| Testing and deployment | Planned |

## Future Improvements

Additional improvements may include:

- Enhanced user experience and responsive design.
- Improved booking and seat availability management.
- More detailed transportation reports.
- Better system security and access control.

## Contributors

Developed collaboratively by a team of three members.

| Team Member | Responsibility |
|---|---|
| Member 1 | Frontend Development |
| Member 2 | Backend Development |
| Member 3 | Database Development |

## License

This project is developed for academic purposes as a university project.