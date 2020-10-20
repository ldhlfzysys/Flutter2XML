# Flutter2XML

## Introduction
To realize Flutter dynamics and combine with small programs, Flutter only provides rendering capabilities. In order to adapt the small program syntax, Flutter needs to be converted to XML format. The XML format refers to Microsoft XAML and some customization.

## Usage

dart lib/main.dart test/widget_test.dart

## example
```
Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('title'),
      ),
      body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                  child: TabBar(
                tabs: [
                  Tab(text: 'tab1'),
                  Tab(
                    text: 'tab2',
                  ),
                  Tab(
                    text: 'tab3',
                  ),
                ],
                labelColor: Color.fromRGBO(51, 51, 51, 1),
                unselectedLabelColor: Color.fromRGBO(147, 147, 147, 1),
              )),
              Expanded(
                  child: TabBarView(children: [
                Container(
                  child: Center(
                    child: Text('tab1'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('tab2'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('tab3'),
                  ),
                )
              ]))
            ],
          )));
```
convert to
```
<Scaffold>
    <Scaffold.backgroundColor>
        <Colors:white/>
    </Scaffold.backgroundColor>
    <Scaffold.appBar>
        <AppBar elevation="0.0">
            <AppBar.title>
                <Text>
                    <args>
                        <string>title</string>
                    </args>
                </Text>
            </AppBar.title>
        </AppBar>
    </Scaffold.appBar>
    <Scaffold.body>
        <DefaultTabController length="3">
            <DefaultTabController.child>
                <Column>
                    <Column.children>
                        <Container>
                            <Container.child>
                                <TabBar>
                                    <TabBar.tabs>
                                        <Tab text="tab1"></Tab>
                                        <Tab text="tab2"></Tab>
                                        <Tab text="tab3"></Tab>
                                    </TabBar.tabs>
                                    <TabBar.labelColor>
                                        <Color:fromRGBO>
                                            <args>
                                                <int>51</int>
                                                <int>51</int>
                                                <int>51</int>
                                                <int>1</int>
                                            </args>
                                        </Color:fromRGBO>
                                    </TabBar.labelColor>
                                    <TabBar.unselectedLabelColor>
                                        <Color:fromRGBO>
                                            <args>
                                                <int>147</int>
                                                <int>147</int>
                                                <int>147</int>
                                                <int>1</int>
                                            </args>
                                        </Color:fromRGBO>
                                    </TabBar.unselectedLabelColor>
                                </TabBar>
                            </Container.child>
                        </Container>
                        <Expanded>
                            <Expanded.child>
                                <TabBarView>
                                    <TabBarView.children>
                                        <Container>
                                            <Container.child>
                                                <Center>
                                                    <Center.child>
                                                        <Text>
                                                            <args>
                                                                <string>tab1</string>
                                                            </args>
                                                        </Text>
                                                    </Center.child>
                                                </Center>
                                            </Container.child>
                                        </Container>
                                        <Container>
                                            <Container.child>
                                                <Center>
                                                    <Center.child>
                                                        <Text>
                                                            <args>
                                                                <string>tab2</string>
                                                            </args>
                                                        </Text>
                                                    </Center.child>
                                                </Center>
                                            </Container.child>
                                        </Container>
                                        <Container>
                                            <Container.child>
                                                <Center>
                                                    <Center.child>
                                                        <Text>
                                                            <args>
                                                                <string>tab3</string>
                                                            </args>
                                                        </Text>
                                                    </Center.child>
                                                </Center>
                                            </Container.child>
                                        </Container>
                                    </TabBarView.children>
                                </TabBarView>
                            </Expanded.child>
                        </Expanded>
                    </Column.children>
                </Column>
            </DefaultTabController.child>
        </DefaultTabController>
    </Scaffold.body>
</Scaffold>
```
