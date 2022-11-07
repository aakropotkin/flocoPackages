{

  inputs.packument.url   = "https://registry.npmjs.org/@types/request?rev=699-e2cf805f32c19ae3c6193a412b83adc0";
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
    scope = "@types";
    ident = "@types/request";
    ldir  = "info/types/request";
    inherit packument fetchInfo;
  } // latest';

}
