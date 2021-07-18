-- Database viewed as a whole to select columns for data
SELECT *
FROM PortfolioProject..covid_deaths
ORDER BY 3,4;



--Total world view of cases vs deaths with death percentage
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..covid_deaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2;




--World death count by continent
Select location, MAX(CAST(Total_deaths as int)) AS TotalDeathCount
From PortfolioProject..covid_deaths
Where continent is null
Group By location
Order By TotalDeathCount desc;



--Percent of population sorted by country with highest infection count
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..covid_deaths
Group by Location, Population
order by PercentPopulationInfected desc;
