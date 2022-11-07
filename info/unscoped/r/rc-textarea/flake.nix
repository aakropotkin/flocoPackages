{

  inputs.packument.url   = "https://registry.npmjs.org/rc-textarea?rev=21-b56d2a93c0e2f57d14809d3faa29dc23";
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
    ident = "rc-textarea";
    ldir  = "info/unscoped/r/rc-textarea";
    inherit packument fetchInfo;
  } // latest';

}
