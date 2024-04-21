from datetime import datetime, timezone
from typing import Optional

from sqlmodel import SQLModel, Field


class BlogBase(SQLModel):
    title: str = Field(min_length=1, max_length=100, unique=True)
    urlpath: str = Field(default="")


class Blog(BlogBase, table=True):
    __tablename__ = "blogs"
    id: Optional[int] = Field(default=None, primary_key=True)
    created_at: Optional[datetime] = Field(default=datetime.now(timezone.utc))
