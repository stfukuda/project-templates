import streamlit as st


def main():
    st.sidebar.title("{{ cookiecutter.app_name }}")
    st.sidebar.header("Menu")

    select_id = st.sidebar.selectbox(
        "Please select a ID",
        [
            "A001",
            "B002",
            "C003"
        ],
    )

    st.write(select_id)


if __name__ == "__main__":
    main()
