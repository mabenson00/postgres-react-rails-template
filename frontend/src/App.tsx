import React from 'react';
import { useQuery, gql } from '@apollo/client';
import logo from './logo.svg';
import './App.css';

// TODO: Figure out why "due_date" gives error. Null?
const GET_TASKS = gql`
  query GetTasks {
    tasks {
      id
      title
      description
      completed
      dueDate
    }
  }
`;

const CREATE_TASK = gql`
  mutation {
  createTask(input: { taskInput: { title: "GraphQL blog", description: "GraphQL and Ruby on Rails"  }}) {
    task {
      id
      title
      description
    }
  }
}
`;

const App: React.FC = () => {
  const { loading, error, data } = useQuery(GET_TASKS);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error :(</p>;

  return (
    <div className="App">
      <main>
        <h1>Tasks</h1>
        <ul>
          {data.tasks.map((task: any) => (
            <li key={task.id}>{task.title}</li>
          ))}
        </ul>
      </main>
    </div>
  );
};

export default App;
