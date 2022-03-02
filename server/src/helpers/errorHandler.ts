const serverError = (error: any, status = 400) => {
  return {
    success: false,
    status: typeof error === "object" ? error.status ?? status : status,
    message: typeof error === "object" ? error.message : error,
  };
};

export default serverError;
