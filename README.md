# NGMP Edition 2 - ISO generation 1 (ISO19139)

NATO Geospatial Metadata Profile (NGMP) - Edition 2.
       
The aim of the NGMP standard is to specify the use of DGIWG Metadata Foundation (DMF) 
in a NATO Environment (NATO led operations, exercises or national use).
              
DGIWG Metadata Foundation is a general Defence metadata profile for
datasets, series, services, tiles, documents, products and non-geographic datasets, based on the ISO
metadata standards of the ISO 19100 series of standards.
       
DMF allows for metadata based either on:
       
- generation "1" of ISO standards (ISO 19115, ISO 19115-2, ISO 19119, ISO/TS 19139 and ISO/TS 19139-2);

- generation "2" (ISO 19115-1, ISO 19115-3 and ISO 19157-2).
       
This schema plugin handles the **first generation** of ISO standards.


This schema plugin does not offer editing features: it only recognizes metadata belonging to 
the standard, ingests them, visualizes them, and offers them back through CSW.


This schema plugin has been developed on GeoNetwork 3.10.4 and should work on 3.10.4 or greater versions.

## Installing the plugin

### GeoNetwork version to use with this plugin

Use GeoNetwork 3.10.4+ version.  
It'll not be supported in 2.10.x or 3.0.x series so don't plug it into it!

### Adding the plugin to the source code

The best approach is to add the plugin as a submodule into GeoNetwork schema module.

```
cd schemas
git submodule add -b 3.10.x https://github.com/geosolutions-it/iso19139.ngmpv2g1 iso19139.ngmp2v1
```

Add the new module to the `schema/pom.xml`:

```
  <module>iso19139</module>
  <module>iso19139.ngmp2v1</module>
</modules>
```

Add the dependency in the web module in `web/pom.xml`:

```
<dependency>
  <groupId>${project.groupId}</groupId>
  <artifactId>schema-iso19139.ngmp2v1</artifactId>
  <version>${project.version}</version>
</dependency>
```

Add the module to the webapp in web/pom.xml:

```
<execution>
  <id>copy-schemas</id>
  <phase>process-resources</phase>
  ...
  <resource>
    <directory>${project.basedir}/../schemas/iso19139.ngmp2v1/src/main/plugin</directory>
    <targetPath>${basedir}/src/main/webapp/WEB-INF/data/config/schema_plugins</targetPath>
  </resource>
```

### Build the application 

Once the application is build, the war file contains the schema plugin:

```
$ mvn clean install -Penv-prod
```

### Deploy the profile in an existing installation

After building the application, it's possible to deploy the schema plugin manually in an existing GeoNetwork installation:

- Copy the content of the folder `schemas/iso19139.ngmp2v1/src/main/plugin/iso19139.ngmp2v1` to
  `INSTALL_DIR/geonetwork/WEB-INF/data/config/schema_plugins/iso19139.ngmp2v1`

- If the GeoNetwork instance is using an externalized data directory, you'll need to copy 
  - the content of the folder `schemas/iso19139.ngmp2v1/src/main/plugin/iso19139.ngmp2v1` 
    to `DATA_DIR/config/schema_plugins/iso19139.ngmp2v1`
  - the content of the folder `schemas/iso19139.ngmp2v1/src/main/plugin/iso19139.ngmp2v1/schema` 
    to `DATA_DIR/data/resources/xml/schemas/iso19139.ngmp2v1/schema`

There's no need to copy the jar file `schemas/iso19139.ngmp2v1/target/schema-iso19139.ngmp2v1-3.2.x-SNAPSHOT.jar` to
  `INSTALL_DIR/geonetwork/WEB-INF/lib`, since there's no java class or spring file needed for the NGMP profile.


Once the application is started, check the plugin is loaded in the admin > standard page.


