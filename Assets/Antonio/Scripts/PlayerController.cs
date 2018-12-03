﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour 
{
    public GameObject grenadePrefab;
    public Transform grenadeSpawnLocation;
    public float throwForce;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update ()
    {

        if (Input.GetMouseButtonDown(0))
        {
            Fire();
        }
	}

    void Fire()
    {
        // Create the Bullet from the Bullet Prefab
        var bullet = (GameObject)Instantiate(grenadePrefab, grenadeSpawnLocation.position, grenadeSpawnLocation.rotation);

        // Add velocity to the bullet
        bullet.GetComponent<Rigidbody>().AddForce(Camera.main.transform.forward * throwForce, ForceMode.Impulse);
    }

    //void ThrowGrenade()
    //{
    //    if (Input.GetMouseButtonDown(0))
    //    {
    //        GameObject grenade = Instantiate(grenadePrefab, transform.position + new Vector3(1, 0), transform.rotation);
    //        Rigidbody rb = grenade.GetComponent<Rigidbody>();
    //        rb.AddForce(transform.forward * throwForce, ForceMode.VelocityChange);
    //    }
    //}
}