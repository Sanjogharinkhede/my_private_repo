"""

import xml.etree.ElementTree as ET

xml_string = '''<root>
<child name="child1">Value1</child>
<child name="child2">Value2</child>
</root>'''
root = ET.fromstring(xml_string)
# Print root tag
print(f"Root tag: {root.tag}")

# Iterate over elements
for child in root:
    print(f"Tag: {child.tag}, Attributes: {child.attrib}")

# # Modify an element's attribute
for elem in root.findall('.//child'):  # Find all 'item' tags
    elem.set('updated', 'yes')  # Add or update an attribute


# Iterate over elements
# for child in root:
#     print(f"Tag: {child.tag}, Attributes: {child.attrib}")
# Add a new element
new_element = ET.Element('newItem', attrib={'name': 'example'})

new_element.text = "This is a new item"
root.append(new_element)
# Iterate over elements
for child in root:
    print(f"Tag: {child.tag}, Attributes: {child.attrib}")

# Save the modified XML
# tree.write('modified_example.xml', xml_declaration=True, encoding='utf-8')
"""

import xml.etree.ElementTree as ET

tree = ET.parse('some_xml.xml')
root = tree.getroot()

print(root)
xml_data = """
      <book id="mk101">
          <author>Colls</author>
          <title>Guider</title>
          <genre>Computer</genre>
          <price>99.99</price>
          <publish_date>2026-10-01</publish_date>
          <description>An in-depth look of nothing.</description>
      </book>
      """


def read():
    for child in root.iter("price"):
        print(child)
        print(child.text)


def modify():
    for elem in root.findall('./book/price'):
        text = elem.text
        text=float(text)*1.50
        elem.text = "{:.2f}".format(text)
        elem.set("updated", "yes")
        tree.write("some2.xml")

        # read()
modify()
