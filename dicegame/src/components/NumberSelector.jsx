import styled from "styled-components";

const NumberSelector = ({
  setError,
  error,
  selectedNumber,
  setSelectedNumber,
}) => {
  const arrNumber = [1, 2, 3, 4, 5, 6];

  const numberSelectorHandler = (value) => {
    setSelectedNumber(value);
    setError("");
  };

  return (
    <NumberSelectorContainer>
      <p className="error">{error}</p>
      <div className="flex">
        {arrNumber.map((value, i) => (
          <Box
            isSelected={value === selectedNumber}
            key={i}
            onClick={() => numberSelectorHandler(value)}
          >
            {value}
          </Box>
        ))}
      </div>
      <p>Select Number</p>
    </NumberSelectorContainer>
  );
};

const NumberSelectorContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;

  .flex {
    display: flex;
    gap: 12px; /* Reduced gap between number boxes */
    justify-content: center;
  }

  p {
    font-size: 24px; /* Adjust the font size */
    font-weight: 700;
  }

  .error {
    color: red;
    font-size: 18px; /* Adjust the font size for error text */
  }
`;

const Box = styled.div`
  height: 48px; /* Reduced height */
  width: 48px; /* Reduced width */
  border: 1px solid black;
  display: grid;
  place-items: center;
  font-size: 18px; /* Adjust the font size for numbers */
  font-weight: 700;
  background-color: ${(props) => (props.isSelected ? "black" : "white")};
  color: ${(props) => (!props.isSelected ? "black" : "white")};
`;

export default NumberSelector;
