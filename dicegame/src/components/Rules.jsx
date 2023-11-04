import styled from "styled-components";

const Alert = styled.div`
  background-color: #ff0000; /* Red background color */
  color: #fff; /* White text color */
  padding: 10px;
  text-align: center;
  margin-top: 10px;
`;

const RulesContainer = styled.div`
  max-width: 800px;
  margin: 0 auto;
  background-color: #fbf1f1;
  padding: 20px;
  margin-top: 40px;
  border-radius: 10px;
  h2 {
    font-size: 24px;
  }
  .text {
    margin-top: 24px;
  }
`;

const Rules = () => {
  return (
    <div>
      <Alert>
        DON'T FORGET TO TAKE 2 TABLETS OF AMLODIPINE TODAY NIGHT AT 9:00 PM
      </Alert>
      <RulesContainer>
        <h1></h1>
        <h2>How to play the dice game</h2>
        <div className="text">
          <p>Select any number</p>
          <p>Click on the dice image</p>
          <p>
            After clicking on the dice, if the selected number is equal to the
            dice number, you will get the same points as the dice.
          </p>
          <p>If you make a wrong guess, then 2 points will be deducted.</p>
        </div>
      </RulesContainer>
    </div>
  );
};

const RulesContainerMobile = styled(RulesContainer)`
  @media (max-width: 768px) {
    /* Apply these styles for screens with a maximum width of 768px (typical for phones) */
    max-width: 90%; /* Adjust as needed for mobile view */
    margin-top: 20px; /* Adjust as needed for mobile view */
  }
`;

const AlertMobile = styled(Alert)`
  @media (max-width: 768px) {
    /* Apply these styles for screens with a maximum width of 768px (typical for phones) */
    margin-top: 10px; /* Adjust as needed for mobile view */
  }
`;

const RulesMobile = () => {
  return (
    <div>
      <AlertMobile>
        DON'T FORGET TO TAKE 2 TABLETS OF AMLODIPINE TODAY NIGHT AT 9:00 PM
      </AlertMobile>
      <RulesContainerMobile>
        <h1></h1>
        <h2>How to play the dice game</h2>
        <div className="text">
          <p>Select any number</p>
          <p>Click on the dice image</p>
          <p>
            After clicking on the dice, if the selected number is equal to the
            dice number, you will get the same points as the dice.
          </p>
          <p>If you make a wrong guess, then 2 points will be deducted.</p>
        </div>
      </RulesContainerMobile>
    </div>
  );
};

export default RulesMobile;
