{

  inputs.packument.url   = "https://registry.npmjs.org/fork-stream?rev=12-a883a44adad2127fcaa77add9489c1ec";
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
    ident = "fork-stream";
    ldir  = "info/unscoped/f/fork-stream";
    inherit packument fetchInfo;
  } // latest';

}
