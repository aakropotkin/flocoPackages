{

  inputs.packument.url   = "https://registry.npmjs.org/flush-write-stream?rev=11-434caea983d64f54886ad1a954d4e1ec";
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
    ident = "flush-write-stream";
    ldir  = "info/unscoped/f/flush-write-stream";
    inherit packument fetchInfo;
  } // latest';

}
