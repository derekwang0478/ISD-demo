package unit.test;

import junit.framework.Assert;
import org.junit.Test;
import static org.junit.Assert.*;
import uts.isd.model.Calculator;

/**
 *
 * @author George
 * 
 * This class tests the functions of the Calculator class in the model.
 * JUnit tests assert the result of each function. Replicate these tests for the DBManager class CRUD functions
 * To execute the tests, right-click on this class and choose 'Test File' or use the TestRunner class
 */
public class CalculatorTest {

    private Calculator calculator;
    
    public CalculatorTest() {
        calculator = new Calculator();
    } 

    @Test
    public void evaluatesExpression() {        
        int sum = calculator.evaluate("1+2+3");
        assertEquals(6, sum);
    }
    
    @Test
    public void testAdd(){
        int res = calculator.add(2,5);
        assertEquals(7,res);
    }
    
    @Test
    public void testSub(){
        int res = calculator.subtract(5,3);
        assertEquals(2,res);
    }
    
    @Test
    public void testMul(){
        int res = calculator.mul(2,4);
        assertEquals(8,res);
    }
    
    @Test
    public void testPow(){
        double res = calculator.power(2, 3);
        Assert.assertEquals(8.00,res,0.001);
    }
}
