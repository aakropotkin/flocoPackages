{

  inputs.packument.url   = "https://registry.npmjs.org/sudo-prompt?rev=55-d27c0424098139ad38bda070d3a96627";
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
    ident = "sudo-prompt";
    ldir  = "info/unscoped/s/sudo-prompt";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
