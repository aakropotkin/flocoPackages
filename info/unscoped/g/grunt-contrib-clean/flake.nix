{

  inputs.packument.url   = "https://registry.npmjs.org/grunt-contrib-clean?rev=194-c306a3c91be2c075c908eab38962af51";
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
    ident = "grunt-contrib-clean";
    ldir  = "info/unscoped/g/grunt-contrib-clean";
    inherit packument fetchInfo;
  } // latest';

}
