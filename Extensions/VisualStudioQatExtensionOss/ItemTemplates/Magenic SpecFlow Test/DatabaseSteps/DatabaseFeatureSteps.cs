﻿using Magenic.Maqs.SpecFlow.TestSteps;
using System.Data;
using TechTalk.SpecFlow;

namespace $rootnamespace$
{
    /// <summary>
    /// Steps class for $safeitemname$
    /// To utilize MAQS features for the steps in this class, make sure at add a 'MAQS_Database' tag to the feature file(s)
    /// </summary>
    [Binding]
    public class $safeitemname$ : BaseDatabaseTestSteps
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="$safeitemname$"/> class.
        /// </summary>
        /// <param name="context">The scenario context.</param>
        protected $safeitemname$(ScenarioContext context) : base(context)
        {
        }

		/// <summary>
        /// Sample given method
        /// </summary>
        [Given(@"condition")]
        public void GivenCondition()
        {
            ScenarioContext.Current.Pending();
        }
        
        /// <summary>
        /// Sample when method
        /// </summary>
        [When(@"action")]
        public void WhenAction()
        {
            ScenarioContext.Current.Pending();
        }
        
        /// <summary>
        /// Sample then method
        /// </summary>
        [Then(@"verification")]
        public void ThenVerification()
        {
            ScenarioContext.Current.Pending();
        }

        /// <summary>
        /// Queries the database and returns the table
        /// </summary>
        /// <param name="query">The query string</param>
        /// <returns>The data table returned</returns>
        private DataTable QueryDatabase(string query)
        {
            return this.TestObject.DatabaseDriver.QueryAndGetDataTable(query);
        }
    }
}
