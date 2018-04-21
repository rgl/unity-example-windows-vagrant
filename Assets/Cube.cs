using UnityEngine;

public class Cube : MonoBehaviour {
	// you can set this variable on the Editor Inspector pane.
	public float moveSpeed = 10f;

	void Start() {
		print("Start");
	}
	
	// this is called once per frame.
	void Update() {
		// use the arrow keys to move the object around.
		transform.Translate(
			moveSpeed*Input.GetAxis("Horizontal")*Time.deltaTime,
			0f,
			moveSpeed*Input.GetAxis("Vertical")*Time.deltaTime);
	}
}
