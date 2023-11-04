import styled from "styled-components";
import { Button } from "../styled/Button";

const Alert = styled.div`
  background-color: #ff0000;
  color: #fff;
  padding: 10px;
  text-align: center;
  position: absolute;
  top: 10px;
  right: 10px;
  left:4px
`;

const RulesContainer = styled.div`
  max-width: 800px;
  margin: 0 auto;
  background-color: #fbf1f1;
  padding: 20px;
  margin-top: 40px;
  border-radius: 10px;
  position: absolute;
  top: 10px;
  h2 {
    font-size: 24px;
  }
  .text {
    margin-top: 24px;
  }
`;

const StartGame = ({ toggle }) => {
  return (
    <Container>
      <div>
        <img src="/images/dices.png" alt="Dice Image" />
      </div>
      <div className="content">
        <h1>Dice Game</h1>
        <Alert>
          DON'T FORGET TO TAKE 2 TABLETS OF DOFETILIDE TODAY EVENING AT 4:30 PM
          !!!!
        </Alert>
        <Button onClick={toggle}>Play Now</Button>
      </div>
    </Container>
  );
};

const Container = styled.div`
  max-width: 1180px;
  height: 100vh;
  display: flex;
  margin: 0 auto;
  align-items: center;

  .content {
    h1 {
      font-size: 48px; /* Reduce font size for smaller screens */
    }
  }

  @media (max-width: 768px) {
    /* Apply these styles for screens with a maximum width of 768px (typical for phones) */
    .content {
      h1 {
        font-size: 36px; /* Further reduce font size for smaller screens */
      }
    }
    div img {
      max-width: 80%; /* You can adjust this value as needed */
    }
  }
`;

export default StartGame;
