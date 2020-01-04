using Microsoft.VisualStudio.TestTools.UnitTesting;
using FPTInternshipManagement.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Model;
using Repository;
namespace UnitTestFPTInternshipManagerment
{
    /// <summary>
    /// Summary description for HomeControllerTests
    /// </summary>
    [TestClass]
    public class DepartmentRepositoryTests
    {
        private IDepartmentRepository testDepartment = new DepartmentRepository();
        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test 
        // [TestInitialize()]
        // public void MyTestInitialize() { }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        [TestMethod]
        public void TestGetAllDepartments()
        {
            testDepartment.GetAllDepartments();
        }
        [TestMethod]
        public void TestGetDepartmentById()
        {
            var id = 1;
            testDepartment.GetDepartmentById(id);
        }

        [TestMethod]
        public void TestGetToDictionary()
        {
            testDepartment.GetAllDepartments();
            testDepartment.GetToDictionary();
        }

        [TestMethod]
        public void TestGetToDictionaryHome()
        {
            testDepartment.GetToDictionary();
            testDepartment.GetToDictionaryHome();
        }

    }
}
