public class CoindeskResources {
    
    public class BitcoinPriceIndexResource {

        public TimeEntity updatetime {get; set;}
        public String disclaimer {get; set;}
        public String chartName {get; set;}
        public BPIEntity bpi {get; set;}

    }

    public class TimeEntity {
        public String updated {get; set;}
        public Datetime updatedISO {get; set;}
        public String updateduk {get; set;}
    }

    public class BPIEntity {
        public CurrencyEntity USD {get; set;}
        public CurrencyEntity GPB {get; set;}
        public CurrencyEntity EUR {get; set;}
    }

    public class CurrencyEntity {
        public String code {get; set;}
        public String symbol {get; set;}
        public String rate {get; set;}
        public String description {get; set;}
        public Decimal rate_float {get; set;}
    }
}