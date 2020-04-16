- 目录
{:toc #markdown-toc}	

# Reference

Apache Flink is used to process huge volumes of data at lightning-fast speed using traditional SQL knowledge.

https://www.tutorialspoint.com/apache_flink/index.htm

https://ci.apache.org/projects/flink/flink-docs-stable/



# Big Data Platform

This Big Data can be in structured, semi-structured or un-structured format.

Volume, Velocity, Variety  -》Veracity, Validity, Vulnerability, Value, Variability, etc.

There are a few popular big data frameworks such as Hadoop, Spark, Hive, Pig, Storm and Zookeeper.



# Batch vs Real-time Processing

Processing based on the data collected over time is called Batch Processing. 

Processing based on immediate data for instant result is called Real-time Processing. 

An ideal tool for such real time use cases would be the one, which can input data as stream and not batch. Apache Flink is that real-time processing tool.




|    Batch Processing                                            |    Real-Time Processing    |
| --------------------------------------- | ----------------- |
| Static Files                                                        |  Event Streams |
| Processed Periodically in minute, hour, day etc.     |  Processed immediately nanoseconds |
| Past data on disk storage                                   |  In Memory Storage |



#  Ecosystem on Apache Flink

   ![Flink Ecosystem]({{ site.baseurl }}/imgs/flink/ecosystem_on_apache_flink.jpeg)

  


