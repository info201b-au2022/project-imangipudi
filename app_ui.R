
ui <- fluidPage(
  tabsetPanel(
    tabPanel(
      title = "Introduction",
      h1("Suicide Rates Across the World"),
      p("We have chosen to analyze suicide rates across the world. Suicide continutes to be a leading cause of death across the world, which is why we find it important to study the data reported on this issue, and learn ways we can mitigate this issue. The dataset we have used includes suicide rates per country, sex, and year dating from 2000 to 2019. We seek to address questions such as which countires have the highest suicides rates, which age groups have had the highest suicide rates, as well as whicih years have had the highest suicide rates. With these questions, we hope to find patterns which will allow us to determine ways to decrease the deaths caused by suicides."),
      img(src = "suicide-and-suicide-behavior_thumb.jpg")
    ),
    
    tabPanel(
      title = "Interactive 1",
      
      h2("Suicide Rate Comparison by Gender"),
      selectInput(inputId = "country1", label = "Select a Country", 
                  choices = countries_list),
      plotOutput("barchart"),
      p("This chart is used to show the difference in suicide rates across the sexes of each country. For the majority of countries, males had the highest suicide rates. By exploring the data through the interactive visualization, you can see that some countries have a greater difference in suicide rates between sexes, but in almost all countries, the male suicide rates are higher than the female suicide rate."),
      
      h2("Map of Suicide Rates by Country"),
      selectInput(inputId = "country", label = "Select a Country", 
                  choices = countries_list),   
      selectInput(inputId = "sex", label = "Select a Sex", 
                  choices = sexes),  
      plotOutput("map"),
      p("This interactive chart allows you to select a country and sex and displays the suicide rate for that country. Viewers can use the widgets to switch countries and the rates associated with both sexes, male, or female.")
    ),
    
    
    tabPanel(
      title = "Interactive 2",
      
      sliderInput("year1", label = "Year range", min = 2001, 
                  max = 2019, value = 2019),
      
      selectInput(inputId = "color", label = "Select a Color", 
                 choices = c("pink", "blue", "red", "purple")),
      plotOutput("bar"),
      
      p("This chart is used to show how the suicide rates have progressed over the years, ranging from 2000 to 2019. To do so the suicide rates from all the countries were averaged out to create a global suicide rate. The suicide rates typically have a declining pattern as the years progress. The highest rate was in 2000, with an average of 13.2306. While 2019 has the lowest global rate of 10.08689.")
      
    ),
    
    
    tabPanel(
      title = "Interactive 3",
      
      selectInput("age1", label = "Select box", 
                  choices = c("xover85", "x75-84", "x65-74", "x55-64", "x45-54", "x35-44", "x25-34", "x15-24")),
      selectInput("age2", label = "Select box", choices = c("xover85", "x75-84", "x65-74", "x55-64", "x45-54", "x35-44", "x25-34", "x15-24")),
      
      plotOutput("ages"),
      
      p("This visualization shows the suicide rates for different age ranges, with the option to select and view two different age groups at the same time you can compare the rates between multiple age ranges. Using the two options we can see that there is a clear gap between over 85 and any other age range.")
                  
    ),
    tabPanel(
      title = "Summary Page",
      h1("Summary"), 
      p(strong("Our data set has four main takeaways: ")), 
      
      p("1) The year 2000 has the largest suicide rate from the range 2000-2019, so as the the years progressed, the suicide rate declined"), 
      p("2) The age group from 85 years and over has the highest suicide rate, as people got older the suicide rate increased"),
      p("3) Men have higher suicide rates than women"),
      p("4) The country with the largest suicide rate globally was Lesotho in Africa")
      
    
      
    ),
    tabPanel(
      title = "Report",
      
      h1("Suicide Rates"),
      p("Code name: Shrek"),
      p("Authors: Cammi Pham (cammip@uw.edu), Ira Mangipudi (m1ra@uw.edu), Ayaan Ali Rahim (arahim@uw.edu), and Diana Almanza (dalman@uw.edu)"),
      p("Affiliation: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington Date: Autumn 2022"),
      
      h2("Abstract"),
      p("Our main question is, how should mental health and suicide be evaluated? This question is important because to further understand mental health and suicide, we must examine possible conditions that might negatively affect the two topics. To address the question, we will investigate the correlation between different personal qualities and suicide rates. We are concerned with mental health and suicide because it is something that could affect all of our family, friends, and peers. To address this concern, we plan to use the information we find to create a project deliverable that shows which qualities we should focus on while evaluating mental health and suicide."),
      
      h2("Keywords"),
      p("Global mental health, age, suicide rate, and gender"),
      
      h2("Introduction"),
      p("Approximately 800,000 people globally die from suicide each year, suicide continues to be the second leading cause of death in youth and is the top 3 leading causes of death globally. In addition to the 800,000 people who die from suicide each year 20x more attempt suicide. An estimated 1.3% of the global population dies from suicide each year, raising an alarming amount of concern. Our issue is important because so much of the population die from suicide each year and these people could be those who we share relationships with, so it's important that we know the leading causes.Our study of the data set will serve to further our understanding of how the environment, gender, age, and other circumstances influence mental health and suicide rates in different countries and years. Our main question is how should mental health and suicide be evaluated? We will examine this by looking into the association between suicide rates and different characteristics."),

      h2("Problem Domain"),
      p("Project framing: The domain of this problem extends to all human beings. We are addressing questions on mental health by examining the relationship between suicide rates and factors such as age, country of residence, time of suicide and possible events during this time, and gender. Because of the vast categories being observed, the domain extends to various industries, whether it be political, economic, or social. The essential issue we are addressing is suicides caused by poor mental health, and how to mitigate this.

Human values: The primary value present here is the value of human life. Suicides occur due to factors that decrease one's perception of the value of their life, and this should not be an issue that anyone should experience. Within this data, the value of one's life and the tragic suicides that have occurred due to factors that we will explore are handled carefully.

Direct and indirect stakeholders: The direct stakeholders of this topic are those within the health sector as well as those responsible for any events within a specific time period which may have led to a rise in suicides. These people are affected directly since we are looking for possible reasons behind suicides, and if we need to address the issue of poor mental health we must look at what is causing it and who can be responsible for mitigating these rates. The indirect stakeholders are people who have some level of effect on this dataset. Since the data compare factors such as gender, age, and country of residence, which are factors that everyone has, it brings in the human population as a whole when viewing those who are indirectly affected by the data and its results.

Possible harms and benefits: The main benefit of using this data is to mitigate the reasons behind suicides and decrease the rate of suicides globally. This could be done by first labeling these possible causes and then discovering ways to prevent these causes. Within this process, certain direct stakeholders, such as those who work in the health sector, can be slightly harmed as there may be a need for change within the operations of this sector. Also, one possible harm is that of mislabeling a factor as one that has caused suicides. We have to be careful in examining the data and forming correlations, as mislabeling can lead to the spread of false information and thus work against the purpose of mitigating suicide rates."),
      
      h2("Research Questions"),
      tags$ul(
        tags$li("Which countries have the highest suicide rates compared to other countries? This question is important because it helps us look at the different environments where suicide is most common. It connects to the problem domain of addressing mental health and looking at the connections between suicide rates and all the other factors."), 
        tags$li("Which age group has the highest suicide rate? Looking into this question allows us to focus specifically on the age groups and this helps us research why certain age groups have larger amounts of suicide. There are certain environments and hardships that cause people to go through a lot of mentally challenging difficulties at each age group that can have an effect on their suicide rates. It is important for us to research each age group and recognize the factors and policies that might be a place for those groups."), 
        tags$li("What year had the largest amount of suicides and what were some possible events that could have influenced that (if any)? This question is very important to our report because it helps us visualize each year and see if the rates of suicide increased or decreased. Learning about the rates in each year and the events that may have influenced this change is important information to know for us to be able to address the problem.")
        ),

    h2("The Dataset"),
    p("The data sets we selected are called Suicide Rates by Country, Suicide Rates by Country and 10-year Age Groups, and Human Resources. Our data sets relate to our problem domain and research questions because it revolves around suicide rates in each country. It will help us answer our research questions by providing us insight into the suicide rates of each country, gender, age range, and more. In addition, to answer our research questions, we will be using the files from this data set to create data visualizations. Observations included in the data set are country, sex, year, age range, and human resources."),
    p("The organization that collected the data sets is called the World Health Organization. The World Health Organization collected this data as a part of its goal to strengthen country health information systems, making data available as a public good, delivering a measurable impact and using data to drive public health policy (WHO, 2022). One main source of funding for the World Health Organization is the donations they receive and fees they receive from members (Countries). People who would benefit from these data sets are people who analyze the data and make observations from them. Organizations that would benefit from this data set are health or mental health organizations. We obtained this data from a link under the project brief."),

    h2("Findings"),
    p("Our findings show that as people who are older have a higher suicide rate than those in younger age groups. For example, the suicide rate for those aged 85 years and older was much higher than those who were 15 - 25 years of age. Additionally, our data showed that as the years progressed, the suicide rate actually declined. The year 2000 had a higher suicide rate globally than the year 2019 did."),
    
    h2("Discussion"),
    p("Our data shows suicide rates from various countries around the world,allowing us to think of certain circumstances that people living in different countries face. There are some countries that have more accessibility to programs that help with mental health and immediate services that help those who are suicidal. Looking at our data visualizations we can clearly see gaps shown in each of the factors, such as how people over 85 have a much bigger suicide rate than any other age gap. It is necessary that there is aid and programs specifically for mental health all around the world."),
    
    h2("Conclusion"),
    p("This dataset has shown the various patterns present among variables such as age, country, and sex, with suicide rates. Our main takeaway has to do with age and location, as we have found that different sexes do not have a signifcantly higher or lower average suicide rate. When looking at age, it is shown that those who are older tend to have a higher average suicide rate. More specifically, there was a large difference between those who are 85 and older and those who are younger. This shows that we should be increasing our efforts and services to tailor towards those who are older and may need help, as this can help prevent suicides. Looking at location, there is a pattern of higher rates in countries which are less developed compared to those who are more developed. For example, in 2019, countries such as Lesotho tend to have the highest suicide rates as they do not have as many resources for help as more developed countries. Also, certain countires have a much higher population, thus having a higher suicide rate, which is something that is not factored into the dataset. Lastly, looking at the world as a whole, we have noticed a decline in average suicide rates from previous years, which indicates a step in the right direction. While this is good, there are more steps that can be taken to prevent suicides, such as offering more services to older people, providing more help to those in underdeveloped countries, and continuing to collect data and find helpful patterns."),
    
    h2("References"), 
    tags$ul(
      tags$li("National Institute of Mental Health. (2022). https://www.nimh.nih.gov/health/statistics/suicide"),
      tags$li(" World Health Organization (2021). https://apps.who.int/gho/data/node.main.MHSUICIDEASDR?lang=en"),
      tags$li("World Health Organization (2021). https://apps.who.int/gho/data/node.main.MHSUICIDE10YEARAGEGROUPS?lang=en"),
      tags$li("World Health Organization (2021). https://apps.who.int/gho/data/node.main.MHHR?lang=en")
    )
    
)))
library(shiny)

