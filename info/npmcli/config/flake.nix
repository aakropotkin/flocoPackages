{

  inputs.packument.url   = "https://registry.npmjs.org/@npmcli/config?rev=56-cdf80ea5a31cf5c2371ceda738fb14de";
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
    scope = "@npmcli";
    ident = "@npmcli/config";
    ldir  = "info/npmcli/config";
    inherit packument fetchInfo;
  } // latest';

}
