package com.atg.Itemsearch.api;

import com.google.api.client.util.ArrayMap;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
import com.google.protobuf.Descriptors.FieldDescriptor;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class R_GoogleVisionApi {

	public static void main(String[] args) throws IOException {
		detectLabels();
	}

	public static void detectLabels() throws IOException {
		String filePath = "C:/Users/yeonjoo/Desktop/42103_39435_4628.jpg";
		detectLabels(filePath);
	}

	// overload
	// Detects labels in the specified local image. 지정된 로컬 이미지에서 레이블 감지
	public static String[] detectLabels(String filePath) throws IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();

		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Feature.Type.LABEL_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			//Map<FieldDescriptor, Object> map = new HashMap<FieldDescriptor, Object>();
			List<String> list = new ArrayList<>();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.format("Error: %s%n", res.getError().getMessage());
					return null;
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
					
					Map<FieldDescriptor, Object> map = new HashMap<FieldDescriptor, Object>();
					
					//annotation.getAllFields().forEach((k, v) -> System.out.format("%s : %s%n", k, v.toString()));
					annotation.getAllFields().forEach((k, v) -> list.add(k +"=" + v.toString()+"="));
					
					//annotation.getAllFields().forEach((k, v) -> map.put(k, v.toString()));
					//list.add(map);
				}				
			}
						
						
			return printList(list);
			
			// prn test to Map
			/*
			 * List<Map<String, String>> list_item = new ArrayList<>();
			 * for(Map<FieldDescriptor, Object> map : list) {
			 * 
			 * Map<String, String> item_map = new HashMap<>();
			 * 
			 * Set<Map.Entry<FieldDescriptor, Object>> entry = map.entrySet();
			 * 
			 * //Iterator<Entry<FieldDescriptor, Object>> e = entry.iterator();
			 * 
			 * for(Entry<FieldDescriptor, Object> e : entry) {
			 * 
			 * item_map.put(e.getKey().toString(), e.getValue().toString());
			 * 
			 * } Set<Map.Entry<String, String>> eq = item_map.entrySet();
			 * 
			 * for(Entry<String, String> e : eq) { //item_name[i] = e.getKey();
			 * if(e.getKey().equals("google.cloud.vision.v1.EntityAnnotation.description"))
			 * { //System.out.println(e.getValue()); } }
			 * 
			 * //System.out.println(item_map.get(
			 * "google.cloud.vision.v1.EntityAnnotation.description"));
			 * //System.out.println(item_map.get(
			 * "google.cloud.vision.v1.EntityAnnotation.description").getClass().getName());
			 * 
			 * list_item.add(item_map);
			 * 
			 * }
			 * 
			 * return list_item;
			 */
			
		} // try
		
	}// mathod
	
	public static String[] printList(List<String> list) {
		
		String item_name = "";
		String[] item_array = null;
		
		for (int i = 0; i < list.size(); i++) {
			item_name += list.get(i);
		}
		
		item_array = item_name.split("=");
		
		// Try println(item_array); for test				
		/*
		for(int i = 0; i<item_array.length; i++) { 
			 System.out.println(item_array[i]);
		 }
		*/ 
		
		
		return item_array;
	}

}// class
