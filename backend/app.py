import streamlit as st
import requests

# Streamlit App Title
st.title("POST Request Integration with Image")

# Input form to collect user data
st.subheader("Upload an Image")
uploaded_image = st.file_uploader("Choose an image...", type=["jpg", "jpeg", "png"])

# URL where you want to send the POST request
api_url = "https://a2de-2401-4900-4e51-1b79-81d2-242f-710a-671e.ngrok.io/hand"

# Submit button
if st.button("Submit"):
    if uploaded_image is not None:
        # Prepare the data with the uploaded image
        files = {"file": uploaded_image}
        st.image(uploaded_image)

        # Sending the POST request with the image file
        response = requests.post(api_url, files=files)
        print(response)

        # Display the response
        st.subheader("Response from API:")
        st.write(f"Status Code: {response.status_code}")
        st.write(f"Response Text: {response.text}")
    else:
        st.warning("Please upload an image before submitting.")

# Sample endpoint for testing
st.subheader("Sample Endpoint for Testing:")
st.write("https://your-image-processing-api.com")