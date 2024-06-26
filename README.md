# yourline-ios-app
 Yourline ios app

# Tutorial for addding GraphQL to iOS

1. Create a folder structure like this
WebService
- GraphQL
--- Schema

2. Download your schema.json and put it in the Schema folder
3. Download the apollo cli tar.gz (https://github.com/apollographql/apollo-ios/releases) in to the *GraphQL* folder
4. Run ./apollo-ios-cli init --schema-namespace YourLineAPI --module-type other 
Note: Other can be swiftPackageManager, or embeddedInTarget. "other" creates just files for us to drag and drop in the project.

5. Edit the configuration json that the cli generates. 
Here's an example of the current YL config
```
{
  "schemaNamespace" : "YourLineAPI",
  "input" : {
    "operationSearchPaths" : [
      "**/*.graphql"
    ],
    "schemaSearchPaths" : [
      "./Schema/*.json"
    ]
  },
  "output" : {
    "testMocks" : {
      "none" : {
      }
    },
    "schemaTypes" : {
      "path" : "./YourLineAPI",
      "moduleType" : {
        "other" : {
        }
      }
    },
    "operations" : {
      "inSchemaModule" : {
      }
    }
  }
}
```

Note the "schemaSearchPaths". Edit that to point to the sub-folder in the GraphQL folder i.e. Schema. Also note the extension is  not ".graphql", it's ".json"

6. run ./apollo-ios-cli generate
7 Open the location of the generated files. Drag and drop them in to your project in the Xcode navigation panel
8. Build to test if all's good.
