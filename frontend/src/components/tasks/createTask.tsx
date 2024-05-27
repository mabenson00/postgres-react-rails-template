// src/components/tasks/CreateTask.tsx
import React, { useState } from 'react';
import { useMutation } from '@apollo/client';
import { CREATE_TASK } from './mutations';

interface CreateTaskProps {
  refetch: () => void;
}

const CreateTask: React.FC<CreateTaskProps> = ({ refetch }) => {
  const [title, setTitle] = useState<string>('');
  const [description, setDescription] = useState<string>('');
  const [createTask, { data, loading, error }] = useMutation(CREATE_TASK);

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    createTask({ variables: { title, description } }).then(() => {
      refetch();  // Refetch tasks after successful creation
      setTitle('');
      setDescription('');
    });
  };

  return (
    <div>
      <h2>Create Task</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>
            Title:
            <input
              type="text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
            />
          </label>
        </div>
        <div>
          <label>
            Description:
            <input
              type="text"
              value={description}
              onChange={(e) => setDescription(e.target.value)}
            />
          </label>
        </div>
        <button type="submit">Create Task</button>
      </form>
      {loading && <p>Loading...</p>}
      {error && <p>Error: {error.message}</p>}
      {data && <p>Task created successfully!</p>}
    </div>
  );
};

export default CreateTask;
