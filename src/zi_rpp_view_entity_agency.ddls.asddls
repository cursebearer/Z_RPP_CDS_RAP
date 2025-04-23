@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VIEW ENTITY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_RPP_VIEW_ENTITY_AGENCY
  as select from /dmo/agency
{
  key agency_id     as AgencyId,
      name          as Name,
      street        as Street,
      postal_code   as PostalCode,
      city          as City,
      country_code  as CountryCode,
      phone_number  as PhoneNumber,
      email_address as EmailAddress,
      web_address   as WebAddress,
      concat(concat( $projection.AgencyId, '-' ), $projection.Name ) as Concatenado,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_RPP_FUNC_ABAP'
      cast('' as abap.char(255)) as AbapName
}
