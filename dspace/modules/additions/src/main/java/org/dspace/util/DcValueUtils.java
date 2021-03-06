package org.dspace.util;

import org.dspace.content.DCValue;

/**
 * Created by: Antoine Snyers (antoine at atmire dot com)
 * Date: 06 Mar 2014
 */
public class DcValueUtils {

    public static DCValue copy(DCValue source) {
        DCValue copy = new DCValue();
        copy.value = source.value;
        copy.authority = source.authority;
        copy.confidence = source.confidence;
        copy.element = source.element;
        copy.language = source.language;
        copy.qualifier = source.qualifier;
        copy.schema = source.schema;
        return copy;
    }

    public static boolean equalField(DCValue dc1, DCValue dc2) {
        if (dc1 == dc2) {
            return true;
        }
        if (dc1.element != null ? !dc1.element.equals(dc2.element) : dc2.element != null) {
            return false;
        }
        if (dc1.qualifier != null ? !dc1.qualifier.equals(dc2.qualifier) : dc2.qualifier != null) {
            return false;
        }
        if (dc1.schema != null ? !dc1.schema.equals(dc2.schema) : dc2.schema != null) {
            return false;
        }
        return true;
    }

    public static boolean equal(DCValue dc1, DCValue dc2) {
        if (dc1 == dc2) {
            return true;
        }

        if (dc1.confidence != dc2.confidence) {
            return false;
        }
        if (dc1.authority != null ? !dc1.authority.equals(dc2.authority) : dc2.authority != null) {
            return false;
        }
        if (dc1.element != null ? !dc1.element.equals(dc2.element) : dc2.element != null) {
            return false;
        }
        if (dc1.language != null ? !dc1.language.equals(dc2.language) : dc2.language != null) {
            return false;
        }
        if (dc1.qualifier != null ? !dc1.qualifier.equals(dc2.qualifier) : dc2.qualifier != null) {
            return false;
        }
        if (dc1.schema != null ? !dc1.schema.equals(dc2.schema) : dc2.schema != null) {
            return false;
        }
        if (dc1.value != null ? !dc1.value.equals(dc2.value) : dc2.value != null) {
            return false;
        }

        return true;
    }


}
