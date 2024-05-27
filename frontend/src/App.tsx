// src/App.tsx
import React from 'react';
import { useQuery, gql } from '@apollo/client';
import './App.css';
import CreateTask from './components/tasks/createTask';
import TaskItem from './components/tasks/taskItem';

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

const App: React.FC = () => {
  const { loading, error, data, refetch } = useQuery(GET_TASKS);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error :(</p>;

  return (
    <div className="App">
      <main>
        <div>
          <h1>Task Manager</h1>
          <CreateTask refetch={refetch} />
        </div>
        <h1>Tasks</h1>
        <ul className="task-list">
          {data.tasks.map((task: any) => (
            <TaskItem
              key={task.id}
              id={task.id}
              title={task.title}
              description={task.description}
              dueDate={task.dueDate}
              completed={task.completed}
              refetch={refetch}
            />
          ))}
        </ul>
      </main>
    </div>
  );
};

export default App;
