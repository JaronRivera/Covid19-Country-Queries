-- Database viewed as a whole to select columns for data
SELECT *
FROM PortfolioProject..covid_deaths
ORDER BY 3,4;

Select *
From PortfolioProject..covid_vaccinations
Order by 3,4;


--Joining the vaccinations table and the death table
SELECT *
FROM PortfolioProject..covid_deaths dea
JOIN PortfolioProject..covid_vaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date;



--PeopleVaccinated vs People Fully Vaccinated
Select location, MAX(cast(people_vaccinated as int)) as HighestPopulationVaccinated, MAX(cast(people_fully_vaccinated as int)) as HighestPopulationFullyVaccinated
FROM PortfolioProject..covid_vaccinations
Where continent is not null
Group by location
ORDER BY 1;



--Vaccinations done per day
SELECT dea.location,dea.date,
Sum(Cast(vac.new_vaccinations as int)) Over (partition by dea.location Order by dea.location, dea.date) as RollingPeopleVaccinated
FROM PortfolioProject..covid_deaths dea
join PortfolioProject..covid_vaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
order by 1;


--Highest number of cases vs highest amount of tests done

SELECT dea.location, MAX(cast(dea.total_cases as int)) as HighestCases, MAX(cast(vac.total_tests as int)) as HighestTests
FROM PortfolioProject..covid_deaths dea
join PortfolioProject..covid_vaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
Group By dea.location
order by 1;
