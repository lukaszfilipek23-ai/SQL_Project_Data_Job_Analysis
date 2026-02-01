# Wprowadzenie
Ten projekt został zrealizowany w języku SQL i ma na celu analizę rynku pracy dla stanowiska Analityk Danych na podstawie ofert pracy.

**Główne cele projektu:**

- identyfikacja najbardziej pożądanych umiejętności wśród Analityków Danych,

- analiza zależności między popytem na konkretne kompetencje a poziomem wynagrodzeń,

- określenie, które umiejętności oferują najlepszy kompromis między częstością występowania a płacą.

Link do SQL queries: 
[project_sql folder](/project_sql/) 
# Kontekst projektu
Motywacją stojąca za przygotowaniem tego projektu było zrozumienie rynku pracy Anlityków Danych i zaplanowanie optymalnej ścierzki rozwoju w tym obszarze.

Pytania, na które chciałem odpowiedzieć za pomocą zapytań SQL, brzmiały: 
1. Jakie są najlepiej płatne stanowiska dla Analityka Danych?
2. Jakie umiejętności są wymagane na najlepiej płatnych stanowiskach? 
3. Jakie umiejętności są najbardziej poszukiwane u Analityków Danych? 
4. Które umiejętności wiążą się z wyższymi zarobkami? 
5. Jakie są najbardziej optymalne umiejętności do nauki dla Analityka Danych, który chce zmaksymalizować wartość rynkową?
# Wykorzystane narzędzia
W tym projekcie wykorzystałem różnorodne narzędzia do przeprowadzenia analizy: 
- **SQL (Structured Query Language):** Umożliwił mi interakcję z bazą danych, wyciąganie wniosków i odpowiadanie na kluczowe pytania za pomocą zapytań. 
- **PostgreSQL:** Jako system zarządzania bazą danych, PostgreSQL umożliwił mi przechowywanie, wyszukiwanie i przetwarzanie danych z ofert pracy. 
- **Visual Studio Code:** Ta platforma administracyjno-programistyczna typu open source pomogła mi zarządzać bazą danych i wykonywać zapytania SQL.
# Analiza danych
Każde zapytanie w ramach tego projektu miało na celu zbadanie konkretnych aspektów rynku pracy analityków danych. Oto moje podejście do każdego pytania: 
### 1. Najlepiej płatne stanowiska analityka danych
Aby zidentyfikować najlepiej płatne stanowiska, przefiltrowałem stanowiska analityka danych według średniego rocznego wynagrodzenia. To zapytanie wskazuje na wysoko płatne możliwości w tej dziedzinie.
```sql
--Top 10 najwyższego wyngrodzenia dla Analityków Danych
SELECT
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
	name AS company_name
FROM
	job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
	job_title = 'Data Analyst'
	AND salary_year_avg IS NOT NULL

ORDER BY
	salary_year_avg DESC 
LIMIT 10
```

![Częstość](assets\1.png)
*Tu jest obrazek*

 Tu trzeba ogarnąć pozostałe zapytania...

# Czego się nauczyłem?

# Wnioski końcowe