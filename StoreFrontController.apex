public class StoreFrontController {

    List<DisplayMerchandise> products;
    
    public List<DisplayMerchandise> getProducts() {
        if(products == null) {
            products = new List<DisplayMerchandise>();
            for(Merchandise__c item : [
                    SELECT Id, Name, Description__c, Price__c, Total_Inventory__c 
                    FROM Merchandise__c]) {
                products.add(new DisplayMerchandise(item));
            }
        }
        return products;
    }
    
    // Inner class to hold online store details for item
    public class DisplayMerchandise {

        private Merchandise__c merchandise;
        public DisplayMerchandise(Merchandise__c item) {
            this.merchandise = item;
        }

        // Properties for use in the Visualforce view
        public String name {
            get { return merchandise.Name; }
        }
        public String description {
            get { return merchandise.Description__c; }
        }
        public Decimal price {
            get { return merchandise.Price__c; }
        }
        public Boolean inStock {
            get { return (0 < merchandise.Total_Inventory__c); }
        }
        public Integer qtyToBuy { get; set; }
    }
}
