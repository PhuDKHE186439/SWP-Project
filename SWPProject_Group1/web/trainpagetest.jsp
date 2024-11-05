<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List, model.account, model.train, dal.AccountDAO, model.role, dal.RoleDAO, java.util.ArrayList"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Train Selection</title>
    <jsp:include page="header1.jsp"/>
    <style>
        :root {
            --primary-color: #4CAF50;
            --primary-dark: #45a049;
            --secondary-color: #2196F3;
            --background-color: #f5f5f5;
            --card-background: #ffffff;
            --text-primary: #333333;
            --text-secondary: #666666;
            --shadow: rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, sans-serif;
        }

        body {
            background-color: var(--background-color);
            color: var(--text-primary);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

        .page-header {
            text-align: center;
            margin-bottom: 3rem;
            padding: 2rem 0;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px var(--shadow);
        }

        .page-header h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .search-filters {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            padding: 1rem;
            background-color: var(--card-background);
            border-radius: 0.5rem;
            box-shadow: 0 2px 4px var(--shadow);
        }

        .filter-input {
            flex: 1;
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 0.25rem;
            font-size: 0.9rem;
        }

        .train-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            padding: 1rem 0;
        }

        .train-card {
            background-color: var(--card-background);
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 4px 6px var(--shadow);
            transition: transform 0.2s ease-in-out;
        }

        .train-card:hover {
            transform: translateY(-4px);
        }

        .train-header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem;
            text-align: center;
        }

        .train-body {
            padding: 1.5rem;
        }

        .train-info {
            margin-bottom: 1.5rem;
        }

        .train-name {
            font-size: 1.4rem;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .train-schedule {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin: 1rem 0;
            padding: 1rem;
            background-color: #f8f9fa;
            border-radius: 0.5rem;
        }

        .schedule-item {
            text-align: center;
        }

        .schedule-item span {
            display: block;
            color: var(--text-secondary);
        }

        .schedule-item strong {
            font-size: 1.1rem;
            color: var(--text-primary);
        }

        .train-features {
            display: flex;
            gap: 1rem;
            margin: 1rem 0;
            flex-wrap: wrap;
        }

        .feature-tag {
            padding: 0.25rem 0.75rem;
            background-color: #e9ecef;
            border-radius: 1rem;
            font-size: 0.9rem;
            color: var(--text-secondary);
        }

        .book-button {
            width: 100%;
            padding: 1rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .book-button:hover {
            background-color: var(--primary-dark);
        }

        .no-trains {
            text-align: center;
            padding: 2rem;
            background-color: var(--card-background);
            border-radius: 0.5rem;
            box-shadow: 0 2px 4px var(--shadow);
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .page-header h1 {
                font-size: 2rem;
            }

            .search-filters {
                flex-direction: column;
            }

            .train-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Loading animation */
        .loading-spinner {
            display: none;
            width: 40px;
            height: 40px;
            margin: 20px auto;
            border: 4px solid #f3f3f3;
            border-top: 4px solid var(--primary-color);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h1>Available Trains</h1>
            <p>Select your preferred train for your journey</p>
        </div>

        <div class="search-filters">
            <input type="text" class="filter-input" placeholder="Search by train name..." id="searchTrain">
            <select class="filter-input" id="sortBy">
                <option value="time">Sort by Time</option>
                <option value="name">Sort by Name</option>
            </select>
        </div>

        <div class="loading-spinner" id="loadingSpinner"></div>

        <div class="train-grid">
            <c:forEach items="${trains}" var="t">
                <form action="comparts" method="Post" class="train-card">
                    <div class="train-header">
                        <h3>${t.trainName}</h3>
                    </div>
                    
                    <div class="train-body">
                        <div class="train-info">
                            <div class="train-schedule">
                                <div class="schedule-item">
                                    <span>Departure</span>
                                    <strong>${t.trainScheduleTime}</strong>
                                </div>
                                <div class="schedule-item">
                                    <span>Duration</span>
                                    <strong>2h 30m</strong>
                                </div>
                            </div>
                            
                            <div class="train-features">
                                <span class="feature-tag">WiFi</span>
                                <span class="feature-tag">Food Service</span>
                                <span class="feature-tag">Power Outlets</span>
                            </div>
                        </div>

                        <input type="hidden" name="trainId" value="${t.trainID}">
                        <input type="hidden" name="tripType" value="${param.tripType}">
                        <input type="hidden" name="ngayDi" value="${param.ngayDi}">
                        <input type="hidden" name="ngayVe" value="${param.ngayVe}">
                        
                        <button type="submit" class="book-button">
                            Select This Train
                        </button>
                    </div>
                </form>
            </c:forEach>
        </div>

        <c:if test="${empty trains}">
            <div class="no-trains">
                <h3>No trains available for the selected criteria</h3>
                <p>Please try different dates or routes</p>
            </div>
        </c:if>
    </div>

    <jsp:include page="footer1.jsp"/>

    <script>
        // Search functionality
        document.getElementById('searchTrain').addEventListener('input', function(e) {
            const searchText = e.target.value.toLowerCase();
            const trainCards = document.querySelectorAll('.train-card');
            
            trainCards.forEach(card => {
                const trainName = card.querySelector('.train-header h3').textContent.toLowerCase();
                if (trainName.includes(searchText)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });

        // Sorting functionality
        document.getElementById('sortBy').addEventListener('change', function(e) {
            const trainGrid = document.querySelector('.train-grid');
            const trainCards = Array.from(document.querySelectorAll('.train-card'));
            
            trainCards.sort((a, b) => {
                const valueA = a.querySelector('.train-header h3').textContent;
                const valueB = b.querySelector('.train-header h3').textContent;
                
                if (e.target.value === 'name') {
                    return valueA.localeCompare(valueB);
                } else {
                    // Sort by time logic - you may need to adjust this based on your time format
                    const timeA = a.querySelector('.schedule-item strong').textContent;
                    const timeB = b.querySelector('.schedule-item strong').textContent;
                    return timeA.localeCompare(timeB);
                }
            });
            
            trainCards.forEach(card => trainGrid.appendChild(card));
        });
    </script>
</body>
</html>