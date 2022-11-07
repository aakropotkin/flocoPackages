{

  inputs.packument.url   = "https://registry.npmjs.org/fs-mkdirp-stream?rev=8-70a77ff875a7a1ec2881b89401607f74";
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
    ident = "fs-mkdirp-stream";
    ldir  = "info/unscoped/f/fs-mkdirp-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
