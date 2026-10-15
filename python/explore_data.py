# Import libraries
import pandas as pd

# Load dataset
file_path = "raw_data/global_ecommerce_sales.csv"
df = pd.read_csv(file_path)

# Basic dataset information
print("Dataset shape:")
print(df.shape)

print("\nColumn names:")
print(df.columns.tolist())

print("\nFirst 5 rows:")
print(df.head())

# Data types
print("\nData types:")
print(df.dtypes)

# Missing values
print("\nMissing values:")
print(df.isnull().sum())

# Duplicate order IDs
print("\nDuplicate Order_ID:")
print (df["Order_ID"].duplicated().sum())

# Order date range
print("\nOrder_Date Range:")
print("Minimum date", df["Order_Date"].min())
print ("Maximum date", df["Order_Date"].max())

#Covert Order_Date to datetime
df["Order_Date"] = pd.to_datetime(df["Order_Date"])
#Check converted date type 
print("\nOrder_Date data type after Conversion:")
print(df["Order_Date"].dtype)

# Numerical Data summary
print("\nNumeriacal Data summary:")
print (df[["Quantity",
           "Unit_Price",
           "Discount_Percent",
           "Total_Sales",
           "Shipping_Cost",
           "Profit"]]. describe())

# Validate Total Sales 
df["calculated sales"] = (df["Quantity"]* df["Unit_Price"]* (1- df["Discount_Percent"] / 100))

df["Sales_Difference"] = (df["Total_Sales"]-df["calculated sales"])
print("\nSales Calcualtion Validation:")
print("maximum difference:", df["Sales_Difference"].abs().max())

#Check Categorical values
print("\n Customer_Segment:")
print(df["Customer_Segment"].unique())

print("\nRegion :")
print(df["Region"].unique())

print("\nProduct_Category:")
print(df["Product_Category"].unique())

print("\nPayment_Method:")
print(df["Payment_Method"].unique())

#Validate Numerical Business Values
print("\n----Numerical Business Values:")
print("Quantity<=0:",(df["Quantity"] <=0).sum())
print("Unit_Price<=0", (df["Unit_Price"] <0).sum())
print("Discount_Percent 0-30%", ((df["Discount_Percent"] <0)|(df["Discount_Percent"]>30)).sum())
print("Total_Sales <= 0:", (df["Total_Sales"] <= 0).sum())
print("Shipping_Cost < 0:", (df["Shipping_Cost"] < 0).sum())

#Validation of OrderID 
print("\nOrder_ID validation:")
print("Missing Order_ID:", df["Order_ID"].isnull().sum())
print("Blank Order_ID:", df["Order_ID"].str.strip().eq("").sum())
print("Duplicate Order_ID", df["Order_ID"].duplicated().sum())