*** SETTINGS ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close Browser

*** VARIABLES ***
${BROWSER}    Chrome
${URL}    https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${ITEM1_NAME}    Sauce Labs Backpack
${ITEM2_NAME}    Sauce Labs Bolt T-Shirt
${ITEM1_PRICE}    $29.99
${ITEM2_PRICE}    $15.99

*** KEYWORDS ***
Log In
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login-button
    Element Should Be Visible    id:shopping_cart_container

Add Items To Cart
    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Button    id:add-to-cart-sauce-labs-bolt-t-shirt
    Wait Until Element Is Visible    css=#shopping_cart_container .shopping_cart_link    5s
  
Open Cart And Verify Contents
    Click Element   css=#shopping_cart_container .shopping_cart_link
    Element Should Be Visible    id:cart_contents_container
    Element Text Should Be    xpath=//*[@id="item_4_title_link"]/div    ${ITEM1_NAME} 
    Element Text Should Be    xpath=//*[@id="item_1_title_link"]/div   ${ITEM2_NAME}    
    Element Text Should Be    xpath=//*[@id="cart_contents_container"]/div/div[1]/div[3]/div[2]/div[2]/div  ${ITEM1_PRICE}    
    Element Text Should Be    xpath=//*[@id="cart_contents_container"]/div/div[1]/div[4]/div[2]/div[2]/div  ${ITEM2_PRICE}

Delete Items From Cart
    Click Element    id:remove-sauce-labs-backpack
    Wait Until Element Is Not Visible    id:item_4_title_link

Make An Order
    Click Element    id:checkout
    Input Text    id:first-name    Test
    Input Text    id:last-name    User
    Input Text    id:postal-code   00100
    Click Element    id:continue
    Element Should Be Visible    id:checkout_summary_container
    Element Should Contain    class:summary_subtotal_label    ${ITEM2_PRICE}
    Click Element    id:finish
    Element Should Be Visible    id:checkout_complete_container
    Element Should Contain    class:complete-header    Thank you for your order!


*** TEST CASES ***

User Can Log In
    Log In

Cart Functionality
    Add Items To Cart
    Open Cart And Verify Contents
    Delete Items From Cart

User Can Make An Order
    Make An Order
