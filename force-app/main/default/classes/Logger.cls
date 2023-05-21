public class Logger {

    private static final String DEBUG_LEVEL = 'DEBUG';
    private static final String ERROR_LEVEL = 'ERROR';

    public static void error(Exception error) {
        try {

            String messageStr = null, causeStr = null, stackTraceStr = null, exceptionType = null;
            Integer lineNumber = null;

            if (error != null){
                if (error.getMessage() != null) messageStr = error.getMessage().abbreviate(32760);
                if (error.getCause() != null && error.getCause().getMessage() != null) causeStr = error.getCause().getMessage().abbreviate(255);
                if (error.getStackTraceString() != null) stackTraceStr = error.getStackTraceString().abbreviate(32760);
                exceptionType = error.getTypeName();
                lineNumber = error.getLineNumber();
            }
            
            Application_Log__b errorLog = new Application_Log__b(
                 Execution_Date__c = Datetime.now(),
                          Level__c = ERROR_LEVEL,
                        Message__c = messageStr,
                 Exception_Type__c = exceptionType,
                Exception_Cause__c = causeStr,
                    Line_Number__c = lineNumber,
                    Stack_Trace__c = stackTraceStr
            );

            if ( !Test.isRunningTest() ) Database.insertImmediate(errorLog);

        } catch (Exception ex) {
            System.debug(ex);
        }
    }

    public static void debug(Object message) {
        try {
            if ( !isDebugEnabled() ) return;

            String messageStr = null;
        
            if (message != null) {
                messageStr = String.valueOf(message).abbreviate(32760);
            }

            Application_Log__b debugLog = new Application_Log__b(
                Execution_Date__c = Datetime.now(),
                         Level__c = DEBUG_LEVEL,
                       Message__c = messageStr
            );

            if ( !Test.isRunningTest() ) Database.insertImmediate(debugLog);
            
        } catch (Exception ex) {
            System.debug(ex);
        }
    }

    private static Boolean isDebugEnabled() {
        return true;
    }
}
