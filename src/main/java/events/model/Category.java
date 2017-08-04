package events.model;

/**
CREATE TABLE category (
		   id   INTEGER DEFAULT NEXTVAL('category_seq')    PRIMARY KEY,   --not null & unique
		   type   VARCHAR(100) NOT NULL);   --type of event
*/

public class Category {
		private Integer id;
		private String type;
		
		/**
		 * counstructor 
		 * @param id
		 * @param type
		 */
		public Category(Integer id, String type) {
			this.id = id;
			this.type = type;
		}

		/**
		 * getters & setters
		 * @return
		 */
		
		public Integer getId() {
			return id;
		}


		public void setId(Integer id) {
			this.id = id;
		}


		public String getType() {
			return type;
		}


		public void setType(String type) {
			this.type = type;
		}


		@Override
		public String toString() {
			return "Category: "+ id + "  type: " + type;
		}
		
}
