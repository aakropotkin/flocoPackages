{

  inputs.packument.url   = "https://registry.npmjs.org/object.reduce?rev=11-506ea4c6c6bff10370e63392e287df4e";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "object.reduce";
    ldir  = "info/unscoped/o/object.reduce";
    inherit packument fetchInfo;
  } // latest';

}
