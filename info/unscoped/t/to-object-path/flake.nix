{

  inputs.packument.url   = "https://registry.npmjs.org/to-object-path?rev=5-0bb89a30740eca0da52f41dd4d26ecf8";
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
    ident = "to-object-path";
    ldir  = "info/unscoped/t/to-object-path";
    inherit packument fetchInfo;
  } // latest';

}
