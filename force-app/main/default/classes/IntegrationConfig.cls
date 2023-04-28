public class IntegrationConfig {

    public String host;
    public String method;
    public String namedCredentials;
    public String path;
    public Integer timeout;

    public static IntegrationConfig forName(String devName) {
        Integration_Config__mdt config = fetchIntegrationConfigs(devName);
        
        return new IntegrationConfig(config);
    }

    public IntegrationConfig(Integration_Config__mdt config){
        this.host = config.Host__c;
        this.method = config.Method__c;
        this.namedCredentials = config.Named_Credentials__c;
        this.path = config.Path__c;
        this.timeout = config.Timeout__c?.intValue();
    }
    
    private static Integration_Config__mdt fetchIntegrationConfigs(String devName) {
        return [SELECT Host__c, Method__c, Named_Credentials__c, Path__c, Timeout__c
                  FROM Integration_Config__mdt
                 WHERE DeveloperName = :devName][0];
    }
}